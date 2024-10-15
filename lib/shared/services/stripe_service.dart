
import 'package:dio/dio.dart';
import 'package:salla/shared/services/api_services.dart';
import 'package:salla/model/payment/data/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:salla/model/payment/data/init_payment_sheet_input_model.dart';
import 'package:salla/model/payment/data/payment_intent_input_model.dart';
import 'package:salla/model/payment/data/payment_intent_model/payment_intent_model.dart';
import 'package:salla/shared/services/api_keys.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.stripePost(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: ApiKeys.paymentIntentUrl,
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetInputModel
          initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemeralKeySecret,
        customerId: initPaymentSheetInputModel.customerId,
        merchantDisplayName:ApiKeys.testCustomerName,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel =
        await createEphemeralKey(customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,  //required to provide saved cards for current customer id 
        ephemeralKeySecret: ephemeralKeyModel.secret!); 
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(     
      {required String customerId}) async {
    var response = await apiService.stripePost(
        body: {'customer': customerId},
        contentType: Headers.formUrlEncodedContentType,
        url: ApiKeys.ephemeralKeyUrl,
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          'Stripe-Version': ApiKeys.stripeVersion,
        });

    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKey;
  }
}

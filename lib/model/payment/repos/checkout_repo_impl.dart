import 'package:dartz/dartz.dart';
import 'package:salla/model/payment/data/payment_intent_input_model.dart';
import 'package:salla/model/payment/repos/checkout_repo.dart';
import 'package:salla/shared/services/stripe_service.dart';
import 'package:salla/shared/utils/error/failures.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);

      return right(null);
    } on StripeException catch (e) {
      print( e.error.message);
      return left(ServerFailure(
          errMessage: e.error.message ?? 'Oops there was an error'));
    } catch (e) {
            print('-------${ e.toString()}');

      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}

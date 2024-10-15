import 'package:dartz/dartz.dart';
import 'package:salla/model/payment/data/payment_intent_input_model.dart';
import 'package:salla/shared/utils/error/failures.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel});
}

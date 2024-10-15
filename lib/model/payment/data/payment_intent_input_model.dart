class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;  //customer id from stripe dashboard

  PaymentIntentInputModel(
      {required this.customerId, required this.amount, required this.currency});

  toJson() {
    return {
      'amount': '${amount}00',
      'currency': currency,
      'customer': customerId
    };
  }
}

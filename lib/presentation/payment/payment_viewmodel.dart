import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ticket_app/domain/ext.dart';
import 'package:ticket_app/domain/services/stripe_service.dart';
import 'package:ticket_app/presentation/payment/payment_states.dart';

class PaymentViewModel {
  StripeService stripeService = StripeService();

  makePayment(WidgetRef ref, amount, currency) async {
    ref.setPaymentState(LoadingPaymentState());
    (await stripeService.makePayment(amount: amount, currency: currency)).fold(
      (left) => ref.setPaymentState(ErrorPaymentState(left)),
      (right) => ref.setPaymentState(SuccessPaymentState()),
    );
  }
}

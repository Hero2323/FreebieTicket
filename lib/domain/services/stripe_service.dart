import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:ticket_app/presentation/styles/app_colors.dart';

import '../constants.dart';
import '../remote/dio_helper.dart';

class StripeService {
  Map<String, dynamic>? paymentIntentData;

  Future<Either<String, String>> makePayment({
    required String amount,
    required String currency,
  }) async {
    try {
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
                merchantDisplayName: 'Tickets App',
                customerId: paymentIntentData!['customer'],
                paymentIntentClientSecret: paymentIntentData!['client_secret'],
                customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
                appearance: const PaymentSheetAppearance(
                    colors: PaymentSheetAppearanceColors(
                  primary: AppColors.red,
                ))));
        await Stripe.instance.presentPaymentSheet();
        return const Right('Payment Done Successfully');
      }
      return const Left('Error: try again later');
    } on Exception catch (e) {
      if (e is StripeException) {
        return Left('StripeException: $e');
      } else {
        return Left('Exception: $e');
      }
    } catch (e, _) {
      return Left('Exception: $e');
    }
  }

  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card',
        'shipping[name]': 'Ammar Elgml\'s order',
        'shipping[address][city]': 'Menoufia, Shepin Elkom',
        'shipping[address][country]': 'Egypt',
        'description': 'My first try',
      };
      var response = await DioHelper.postData(
        url: 'https://api.stripe.com/v1/payment_intents',
        body: body,
        headers: {
          'Authorization': 'Bearer $stripeSecretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      );
      debugPrint("Response Data ${response.data}");
      return response.data;
    } catch (err) {
      debugPrint('Err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}

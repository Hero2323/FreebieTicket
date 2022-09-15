import 'package:flutter/material.dart';
import 'package:ticket_app/presentation/router/router_names.dart';
import 'package:ticket_app/presentation/styles/app_colors.dart';

import '../widgets/payment_option.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var flag = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RouterNames.newCardRoute);
                  // showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return const OrderPlacedDialog();
                  //   },
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0,
        centerTitle: false,
        title: const Text("Payment options"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Select a payment option to continue...",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
          Image.network(
            'https://raw.githubusercontent.com/SupreetRonad/Cart-screen-App/main/imgs/payment.png',
            height: MediaQuery.of(context).size.height * .3,
          ),
          PaymentOption(
            height: 70,
            index: 0,
            name: 'Credit / Debit Card',
            icon: Icons.credit_card,
            flag: flag,
            onPress: () {
              setState(() {
                flag = 0;
              });
            },
          ),
          PaymentOption(
            height: 70,
            index: 1,
            name: 'Internet Banking',
            icon: Icons.language,
            flag: flag,
            onPress: () {
              setState(() {
                flag = 1;
              });
            },
          ),
        ],
      ),
    );
  }
}

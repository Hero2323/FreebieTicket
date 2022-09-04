import 'package:flutter/material.dart';
import 'package:ticket_app/presentation/styles/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Color? textColor;
  final Widget? sufIcon;
  final Widget? prefIcon;

  const CustomTextField({
    required this.controller,
    required this.hint,
    this.textColor,
    this.sufIcon,
    this.prefIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0.0, 0.5),
              blurRadius: 3.0),
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(0.5, 0.0),
              blurRadius: 3.0),
        ],
      ),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: AppColors.black.withOpacity(0.9),
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          hintText: hint,
          hintStyle: TextStyle(
            color: AppColors.grey.withOpacity(0.5),
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          suffixIcon: sufIcon,
          prefixIcon: prefIcon,
        ),
      ),
    );
  }
}

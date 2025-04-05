import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      this.isLoading = false,
      this.buttonText = ''});

  final bool isLoading;
  final VoidCallback? onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF6C90E),
              Color(0xFFF89E31),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x66F89E31),
              offset: Offset(0, 4),
              blurRadius: 8,
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Color(0xFF080A13),
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}

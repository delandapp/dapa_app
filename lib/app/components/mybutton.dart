import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.label,
    required this.colorButton,
    required this.onTap,
  });
  final Function()? onTap;
  final Widget label;
  final int colorButton;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(colorButton),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))),
      onPressed: onTap,
      child: label 
    );
  }
}

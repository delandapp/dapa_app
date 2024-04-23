import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    super.key,
    required this.widthFullBody,
    required this.constraints,
    this.hintText,
    this.prefixIcon,
    required this.controllerField,
    required this.autofocus,
    required this.isPassword,
    required this.controller,
    required this.validator,
  });

  final validator;
  final bool isPassword;
  final bool autofocus;
  final TextEditingController controllerField;
  final double widthFullBody;
  final BoxConstraints constraints;
  final String? hintText;
  final IconData? prefixIcon;
  final controller;

  @override
  Widget build(BuildContext context) {
    return (isPassword) == true ? Obx(() => TextFormField(
        validator: validator,
        controller: controllerField,
        obscureText: controller.isObsure.value,
        autocorrect: false,
        autofocus: autofocus,
        enableInteractiveSelection: false,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily),
        decoration: InputDecoration(
          suffixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  controller.isObsure.value = !controller.isObsure.value;
                },
                child: FaIcon(
                  (controller.isObsure.value) == true
                      ? FontAwesomeIcons.eye
                      : FontAwesomeIcons.eyeSlash,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 9, left: 16),
            child: FaIcon(
              size: 18,
              prefixIcon,
              color: Colors.black,
            ),
          ),
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(
              vertical: constraints.maxHeight * 0.03, horizontal: 20),
          hintStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              fontFamily: GoogleFonts.poppins().fontFamily),
          filled: true,
          fillColor: const Color(0xffD9D9D9),
          // border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: Color(0xff00008B), width: 3)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: Color(0xffD9D9D9))),
        ))
  ) : TextFormField(
        validator: validator,
        controller: controllerField,
        obscureText: false,
        autocorrect: false,
        autofocus: autofocus,
        enableInteractiveSelection: false,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 9, left: 16),
            child: FaIcon(
              size: 18,
              prefixIcon,
              color: Colors.black,
            ),
          ),
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(
              vertical: constraints.maxHeight * 0.03, horizontal: 20),
          hintStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              fontFamily: GoogleFonts.poppins().fontFamily),
          filled: true,
          fillColor: const Color(0xffD9D9D9),
          // border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: Color(0xff00008B), width: 3)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: Color(0xffD9D9D9))),
        ));
  }
}

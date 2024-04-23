import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexreads/app/components/customfield.dart';
import 'package:nexreads/app/components/mybutton.dart';
import 'package:nexreads/app/modules/register/controllers/register_controller.dart';
import '../data/constans/validation.dart';

import 'package:form_validator/form_validator.dart';

extension CustomValidationBuilder on ValidationBuilder {
  custom() => add((value) {
        if (!EmailValidator.isValidEmail(value)) {
          return 'Enter a valid email address with @smk.belajar.id';
        }
        return null;
      });
  password() => add((value) {
        if (!PasswordValidator.isValidPasswordUpper(password: value)) {
          return 'Password must contain at least 1 uppercase letter';
        }
        if (!PasswordValidator.isValidPasswordSymbol(password: value)) {
          return 'Password must contain at least 1 Sysmbol';
        }
        return null;
      });
}

final validatorPassword = ValidationBuilder()
    .minLength(8, 'Password must be at least 8 characters')
    .password()
    .build();
final validator = ValidationBuilder().email().custom().build();


class MyContainerCustom2 extends GetView<RegisterController> {
  const MyContainerCustom2({
    super.key,
    required this.widthFullBody,
    required this.heightFullBody,
    required this.controller,
  });

  final double widthFullBody;
  final double heightFullBody;
  final RegisterController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthFullBody,
      height: heightFullBody * 0.9,
      padding: EdgeInsets.only(top: heightFullBody * 0.15),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(children: [
            const Image(image: AssetImage("assets/logo-black.png")),
            SizedBox(
                width: widthFullBody,
                child: Text(
                  "Create Your Account",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily),
                  textAlign: TextAlign.start,
                )),
            SizedBox(
              height: constraints.maxHeight * 0.03,
            ),
            TextFieldCustom(
              validator: ValidationBuilder().minLength(5).build(),
              controller: controller,
              widthFullBody: widthFullBody,
              constraints: constraints,
              hintText: "Username",
              prefixIcon: FontAwesomeIcons.user,
              autofocus: true,
              controllerField: controller.username,
              isPassword: false,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.03,
            ),
            TextFieldCustom(
              validator: validatorPassword,
              controller: controller,
              widthFullBody: widthFullBody,
              constraints: constraints,
              hintText: "Password",
              prefixIcon: FontAwesomeIcons.key,
              autofocus: false,
              controllerField: controller.password,
              isPassword: true,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.03,
            ),
            TextFieldCustom(
              validator: validator,
              controller: controller,
              widthFullBody: widthFullBody,
              constraints: constraints,
              hintText: "Email",
              prefixIcon: FontAwesomeIcons.envelope,
              autofocus: false,
              controllerField: controller.email,
              isPassword: false,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.03,
            ),
            SizedBox(
              width: widthFullBody,
              height: constraints.maxHeight * 0.08,
              child: Obx(() {
              return MyButton( label: controller.loading.value
                          ? CircularProgressIndicator()
                          : Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w900),
                            ),colorButton: 0xFF00008B,onTap: () => controller.postRegister());
              }) 
            ),
          ]);
        },
      ),
    );
  }
}


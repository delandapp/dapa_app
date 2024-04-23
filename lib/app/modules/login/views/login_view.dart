import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexreads/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:nexreads/app/components/mycontainercustom.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightFullBody = MediaQuery.of(context).size.height;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: widthFullBody * 0.05),
        width: widthFullBody,
        height: heightFullBody,
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyContainerCustom(widthFullBody: widthFullBody, heightFullBody: heightFullBody,controller: controller,),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Alredy have an account? "),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.REGISTER),
                    child: Text("Sign In",style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily),),
                  )
                ],
              ))
            ],
          ),
        ),
      )
    );
  }
}


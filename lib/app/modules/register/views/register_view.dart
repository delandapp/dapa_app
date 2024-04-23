import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexreads/app/components/mycontainercustom2.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
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
              MyContainerCustom2(widthFullBody: widthFullBody, heightFullBody: heightFullBody,controller: controller,),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Alredy have an account? "),
                  GestureDetector(
                    onTap: () => Get.back(),
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

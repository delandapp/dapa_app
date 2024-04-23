import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:nexreads/app/routes/app_pages.dart';
import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 4000), () {
      Get.offAllNamed(Routes.LOGIN);
    });

    final heightFullBody = MediaQuery.of(context).size.height;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      height: heightFullBody,
      width: widthFullBody,
      color: const Color(0xFF00008B),
      child: Center(
        child: LottieBuilder.asset("assets/splashscreen.json")
      ),
    ));
  }
}

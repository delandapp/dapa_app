import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nexreads/app/components/bookDetails.dart';
import 'package:nexreads/app/components/navProfil.dart';

import '../controllers/detailbook_controller.dart';

class DetailbookView extends GetView<DetailbookController> {
  const DetailbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx(
      (state) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                  alignment: Alignment.center,
                  height: 98,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00008B),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35))
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back,color: Colors.white,),
                      Expanded(
                        child: navProfil(
                          title: "Hi ${controller.username.value.toString()}",
                        ),
                      ),
                    ],
                  ),
                ),
                ),
              ),
              Positioned.fill(
                top: 100,
                left: 0,
                right: 0,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: MyBookDetails(
                    controller: controller,
                    dataBookDetails: state!.state1!,
                    dataUlasan: state.state2!,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

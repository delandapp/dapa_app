import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nexreads/app/components/book.dart';
import 'package:nexreads/app/components/navProfil.dart';

import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: controller.obx(
      (state) => Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Color(0XFFFFFFFF)),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00008B),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35))
                  ),
                  child: navProfil(
                    title: "Hi ${controller.username.value.toString()}",
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.87,
                  child: bookSearch(
                    controller: controller,
                    data: state!,
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

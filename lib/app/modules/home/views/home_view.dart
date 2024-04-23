import 'package:nexreads/app/components/buildSection.dart';
import 'package:nexreads/app/components/koleksiBook.dart';
import 'package:nexreads/app/components/navProfil.dart';
import 'package:nexreads/app/components/popularBook.dart';
import 'package:nexreads/app/components/slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightFullBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,),
        // width: widthFullBody,
        child: controller.obx(
          (state) => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: heightFullBody * 0.10,
                  width: widthFullBody,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00008B),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35))
                  ),
                  child: navProfil(
                    title: "Hi ${controller.username.value.toString()}",
                  ),
                ),
                SizedBox(
                  height: heightFullBody * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthFullBody * 0.03),
                  child: SizedBox(height: heightFullBody * 0.3, child: PopularBook(dataKoleksi: state!.state3!)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: widthFullBody * 0.03),
                  child: SizedBox(height: heightFullBody * 0.3, child: KoleksiBook(dataKoleksi: state.state1!)),
                ),
                Column(
                  children: state.state2!.map((data) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: widthFullBody * 0.03),
                      child: SizedBox(
                        width: widthFullBody,
                        height: heightFullBody * 0.24,
                        child: buildSection(data: data),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

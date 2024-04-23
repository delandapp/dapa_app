import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/kategori_controller.dart';
import 'package:nexreads/app/components/kategoriBuild.dart';

class KategoriView extends GetView<KategoriController> {
   const KategoriView({Key? key}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    final heightFullBody =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final widthFullBody = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title:  Text(controller.kategori.toString(),style: TextStyle(color: Colors.black,fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.bold),),
        backgroundColor: const Color(0XFFFFFFFF),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
                  color: Colors.white),
        width: widthFullBody,
        height: heightFullBody,
        child: controller.obx(
          (state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: BukuKategori(data: state!.state1!)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

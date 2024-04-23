import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexreads/app/components/navProfil.dart';
import 'package:nexreads/app/data/provider/storage_provider.dart';
import '../controllers/pinjam_controller.dart';

class PinjamView extends GetView<PinjamController> {
  const PinjamView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: Obx(
            () => Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(color: Colors.white),
              child: AnimatedCrossFade(
                duration: const Duration(milliseconds: 1000),
                firstChild: MyPinjam(
                  controller: controller,
                ),
                secondChild: MyPinjamTrue(controller: controller),
                crossFadeState: controller.sucsesPeminjaman.value == false
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyPinjam extends StatelessWidget {
  const MyPinjam({super.key, required this.controller});
  final PinjamController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                          title: "Hi ${controller.username.toString()}",
                        ),
                      ),
                    ],
                  ),
                ),
                ),),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox.expand(
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () {
                          controller.addPinjam();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF000000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * 0.000000),
                          ),
                        ),
                        child: controller.loading.value
                            ? const CircularProgressIndicator()
                            : Text(
                                'SUBMIT',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: GoogleFonts.baloo2(
                                            fontWeight: FontWeight.bold)
                                        .fontFamily),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: 120,
          left: 20,
          right: 20,
          bottom: 20,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  controller.detailbookController.detailBuku.value.coverBuku
                      .toString(),
                  width: 100,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                controller.detailbookController.detailBuku.value.judulBuku
                    .toString(),
                style: GoogleFonts.inriaSans(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 16.0),
              ),
              Text(
                controller.detailbookController.detailBuku.value.penulisBuku
                    .toString(),
                style: GoogleFonts.inriaSans(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 16.0),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFFFFFFF),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF000000),
                        ),
                        child: Text(
                          "Form Peminjaman",
                          style: GoogleFonts.inriaSans(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 20.0),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama",
                            style: GoogleFonts.inriaSans(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            readOnly: true,
                            initialValue:
                                StorageProvider.read(StorageKey.username),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              isDense: true,
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: const Icon(Icons.people),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFFDDDDDD)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFFDDDDDD)),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Pinjam",
                            style: GoogleFonts.inriaSans(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              isDense: true,
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: const Icon(Icons.date_range),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFFDDDDDD)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFFDDDDDD)),
                              ),
                            ),
                            initialValue:
                                "${controller.day} - ${controller.month} - ${controller.year}",
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tanggal Kembali",
                            style: GoogleFonts.inriaSans(
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 16.0),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              isDense: true,
                              fillColor: Colors.white,
                              filled: true,
                              suffixIcon: const Icon(Icons.date_range),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFFDDDDDD)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide:
                                    const BorderSide(color: Color(0xFFDDDDDD)),
                              ),
                            ),
                            initialValue:
                                "${controller.dayAfter} - ${controller.monthAfter} - ${controller.yearAfter}",
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MyPinjamTrue extends StatelessWidget {
  const MyPinjamTrue({super.key, required this.controller});
  final PinjamController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox.expand(
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF000000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.000000),
                        ),
                      ),
                      child: Text(
                        'Kembali ke Halaman Buku',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily:
                                GoogleFonts.poppins(fontWeight: FontWeight.bold)
                                    .fontFamily),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: 0,
          left: 20,
          right: 20,
          bottom: 50,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Status Peminjaman",
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    overflow: TextOverflow.visible,
                    fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w800)
                        .fontFamily,
                    fontSize: 17.0,
                    color: const Color(0xFF000000),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Nama",
                    style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      isDense: true,
                      fillColor: const Color(0xFFE4E3E3),
                      filled: true,
                      suffixIcon: const Icon(Icons.person),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                    ),
                    initialValue:
                        controller.username.toString(),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Buku Yang Dipinjam",
                    style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      isDense: true,
                      fillColor: const Color(0xFFE4E3E3),
                      filled: true,
                      suffixIcon: const Icon(Icons.book),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                    ),
                    initialValue:
                        controller.detailbookController.detailBuku.value.judulBuku.toString(),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tanggal Pinjam",
                    style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      isDense: true,
                      fillColor: const Color(0xFFE4E3E3),
                      filled: true,
                      suffixIcon: const Icon(Icons.date_range),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                    ),
                    initialValue:
                        "${controller.day} - ${controller.month} - ${controller.year}",
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tanggal Kembali",
                    style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 16.0),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      isDense: true,
                      fillColor: const Color(0xFFE4E3E3),
                      filled: true,
                      suffixIcon: const Icon(Icons.date_range),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                        borderSide: const BorderSide(color: Color(0xFFE4E3E3)),
                      ),
                    ),
                    initialValue:
                        "${controller.dayAfter} - ${controller.monthAfter} - ${controller.yearAfter}",
                  )
                ],
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ],
    );
  }
}

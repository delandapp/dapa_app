import 'package:nexreads/app/data/models/response_ulasan.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexreads/app/data/models/response_detailsbook.dart';
import 'package:nexreads/app/modules/detailbook/controllers/detailbook_controller.dart';
import 'package:nexreads/app/routes/app_pages.dart';

class MyBookDetails extends StatelessWidget {
  const MyBookDetails(
      {super.key,
      required this.dataBookDetails,
      required this.dataUlasan,
      required this.controller});
  final DataBookDetails dataBookDetails;
  final List<DataUlasan>? dataUlasan;
  final DetailbookController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 190,
            width: double.infinity,
            child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image(
                image: NetworkImage(dataBookDetails.coverBuku.toString()),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Container(
                  height: 170,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    image: DecorationImage(
                      image: NetworkImage(dataBookDetails.coverBuku.toString()),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Judul Buku : ${dataBookDetails.judulBuku.toString()}",
                  style: TextStyle(
                      fontFamily:
                          GoogleFonts.poppins(fontWeight: FontWeight.w700)
                              .fontFamily,
                      fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 5),
              Text("Penerbit Buku : ${dataBookDetails.penerbitBuku.toString()}",
                  style: TextStyle(
                      fontFamily:
                          GoogleFonts.poppins(fontWeight: FontWeight.w700)
                              .fontFamily,
                      fontSize: 20),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 5),
              Text("Penulis Buku : ${dataBookDetails.penulisBuku.toString()}",
                  style: TextStyle(
                      fontFamily:
                          GoogleFonts.poppins(fontWeight: FontWeight.w600)
                              .fontFamily,
                      fontSize: 17),
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Genre ",
                      style: TextStyle(
                          fontFamily:
                              GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                  .fontFamily,
                          fontSize: 17),
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis),
                  Row(
                    children: dataBookDetails.kategori!
                        .map(
                          (e) => Text("${e.toString()} ",
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600)
                                      .fontFamily,
                                  fontSize: 17),
                              maxLines: 1,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis),
                        )
                        .toList(),
                  ),
                ],
              ),
              Center(
                child:  RatingBarIndicator(
                direction: Axis.horizontal,
                rating: dataBookDetails.rating!.toDouble(),
                itemCount: 5,
                itemSize: 24,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
              ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            Expanded(
                flex: 4,
                child: Obx(
                  () => ElevatedButton(
                    onPressed: () => controller.addKoleksiBuku(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          controller.detailBuku.value.koleksi == true
                              ? const Color(0xFF0094FF)
                              : const Color(0xFF00008B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width * 0.01),
                      ),
                    ),
                    child: Text(
                      'KOLEKSI',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily:
                              GoogleFonts.baloo2(fontWeight: FontWeight.bold)
                                  .fontFamily),
                    ),
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 4,
              child: ElevatedButton(
                onPressed: () {Get.toNamed(Routes.PINJAM);},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0XFF00008B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.01),
                  ),
                ),
                child: Text(
                  'PINJAM',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily:
                          GoogleFonts.baloo2(fontWeight: FontWeight.bold)
                              .fontFamily),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
        const SizedBox(height: 40),
        Text(
          "Tentang buku ini",
          style: TextStyle(
              fontFamily:
                  GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily,
              fontSize: 20),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        Text(
          dataBookDetails.deskripsi.toString(),
          style: TextStyle(
              fontFamily:
                  GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily,
              fontSize: 20),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20),
        Text(
          "Ulasan",
          style: TextStyle(
              fontFamily:
                  GoogleFonts.poppins(fontWeight: FontWeight.w700).fontFamily,
              fontSize: 20),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 40),
        buildUlasanList(),
        const SizedBox(height: 40),
      ]),
    );
  }

  Widget buildUlasanList() {
    final width = MediaQuery.of(Get.context!).size.width;

    return dataUlasan!.isNotEmpty
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dataUlasan!.length,
            itemBuilder: (context, index) {
              DataUlasan ulasan = dataUlasan![index];
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(140),
                      ),
                      child: Image.asset("assets/profil.png"),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ulasan.username ?? '',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF000000),
                                fontSize: 16),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          RatingBarIndicator(
                            direction: Axis.horizontal,
                            rating: double.parse(dataBookDetails.rating!.toString()),
                            itemCount: 5,
                            itemSize: 28,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Color(0XFFFAC916),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            ulasan.ulasan ?? '',
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 17.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        : Container(
            width: width,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xFF424242),
                width: 0.5,
              ),
            ),
            child: Text(
              'Belum ada ulasan buku',
              style: GoogleFonts.inriaSans(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
          );
  }
}

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nexreads/app/data/models/response_buku.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexreads/app/routes/app_pages.dart';
import 'package:get/get.dart';

class buildSection extends StatelessWidget {
  const buildSection({
    super.key,
    required this.data,
  });

  final DataBuku data;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.kategoriBuku.toString(),
                style: TextStyle(
                  height: 1.2,
                  fontFamily: GoogleFonts.poppins(
                    fontWeight: FontWeight.w900,
                  ).fontFamily,
                  fontSize: 16.0,
                  color: const Color(0xff09142E),
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.KATEGORI, parameters: {"kategori" : data.kategoriBuku.toString()}),
                child: ClipOval(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.arrowRight,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.18,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: data.buku!
                    .map((e) => SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: GestureDetector(
                            onTap: () => Get.toNamed(Routes.DETAILBOOK, parameters: {"idbook" : e.bukuID.toString()}),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 20,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      e.coverBuku.toString(),
                                      fit: BoxFit.fill,
                                      width: MediaQuery.of(context).size.width *
                                          0.24,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        )
      ],
    );
  }
}

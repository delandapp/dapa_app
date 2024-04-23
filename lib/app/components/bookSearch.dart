import 'package:nexreads/app/data/models/response_bookSearch.dart';
import 'package:flutter/material.dart';
import 'package:nexreads/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BookSearch extends StatelessWidget {
  const BookSearch({
    super.key,
    required this.data,
  });

  final List<DataBukuSearch> data;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 3.5, mainAxisSpacing: 10, crossAxisSpacing: 20),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.toNamed(Routes.DETAILBOOK,
                parameters: {"idbook": data[index].bukuID.toString()}),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 140,
                    width: 70,
                    child: Image.network(data[index].coverBuku.toString(),
                        fit: BoxFit.fill),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  data[index].judul.toString(),
                                  style: TextStyle(
                                      fontFamily: GoogleFonts.poppins(
                                              fontWeight: FontWeight.bold)
                                          .fontFamily,
                                      color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  data[index].deskripsi.toString(),
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 10,
                                      fontFamily: GoogleFonts.poppins(
                                              fontWeight: FontWeight.normal)
                                          .fontFamily,
                                      color: Colors.grey[400]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
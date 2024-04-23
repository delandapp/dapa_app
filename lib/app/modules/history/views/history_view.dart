import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexreads/app/data/models/response_history_peminjaman.dart';
import 'package:nexreads/app/modules/history/controllers/history_controller.dart';
import 'package:nexreads/app/routes/app_pages.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final heightFullBody = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: controller.obx(
        (state) => SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            height: heightFullBody,
            width: width,
            child: Obx(
              () => Column(
                      children: [
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () => {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0094FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.01),
                                ),
                              ),
                              child: Text(
                                'HISTORY',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontFamily: GoogleFonts.baloo2(
                                            fontWeight: FontWeight.bold)
                                        .fontFamily),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            ElevatedButton(
                              onPressed: () => Get.toNamed(Routes.BOOKMARK),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFD9D9D9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.01),
                                ),
                              ),
                              child: Text(
                                'BOOKMARK',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontFamily: GoogleFonts.baloo2(
                                            fontWeight: FontWeight.bold)
                                        .fontFamily),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        controller.dataHistoryPeminjaman.value ? const Center(child: Text("Tidak Ada History"),) :
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller.listHistory.length,
                            itemBuilder: (context, index) {
                              return Dismissible(
                                onDismissed: (direction) async {
                                  await controller.deleteHistory(controller
                                      .listHistory[index].peminjamanID!
                                      .toInt());
                                  if (controller.jumlahData.value == 0) {
                                    await controller.getDataHistory();
                                  }
                                },
                                confirmDismiss: (direction) {
                                  return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Confirm'),
                                          content:
                                              Text('Are you sure to delete ?'),
                                          actions: [
                                            Obx(
                                              () => ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(true);
                                                  },
                                                  child: controller
                                                          .loading.value
                                                      ? const CircularProgressIndicator()
                                                      : const Text("Yes")),
                                            ),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(false);
                                                },
                                                child: Text('No')),
                                          ],
                                        );
                                      });
                                },
                                background: Container(
                                  color: Colors.grey,
                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 10),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.amber,
                                    size: 25,
                                  ),
                                ),
                                key: Key(index.toString()),
                                // Mengatur geser dari kanan ke kiri saja
                                direction: DismissDirection.endToStart,
                                child: ContentKoleksi(
                                  width: width,
                                  heightFullBody: heightFullBody,
                                  data: controller.listHistory[index],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContentKoleksi extends StatelessWidget {
  const ContentKoleksi({
    super.key,
    required this.width,
    required this.data,
    required this.heightFullBody,
  });

  final double width;
  final DataHistoryPeminjaman data;
  final double heightFullBody;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: width,
      height: heightFullBody * 0.18,
      margin: EdgeInsets.only(bottom: heightFullBody * 0.02),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 210, 210, 210),
          borderRadius: BorderRadius.circular(10)),
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.PINJAMHISTORY,
            parameters: {"idPinjam": data.peminjamanID.toString()}),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: width * 0.24,
                height: heightFullBody * 0.17,
                child: Image.network(
                  data.coverBuku.toString(),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.judulBuku.toString(),
                    style: TextStyle(
                        fontFamily:
                            GoogleFonts.poppins(fontWeight: FontWeight.w700)
                                .fontFamily,
                        fontSize: 20),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "Loan Status : ${data.tanggalKembali.toString() == "Belum dikembalikan" ? "Active" : "Sudah Kembali"}",
                    style: TextStyle(
                        fontFamily:
                            GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                .fontFamily,
                                color: const Color(0xFF00008B),
                        fontSize: 20),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "Active Until : ${data.deadline.toString()}",
                    style: TextStyle(
                        fontFamily:
                            GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                .fontFamily,
                        fontSize: 20),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00008B),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text(
                    "Extend the loan",
                    style: TextStyle(
                      color: Colors.white,
                        fontFamily:
                            GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                .fontFamily,
                        fontSize: 20),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

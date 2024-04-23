import 'package:nexreads/app/components/bookSearch.dart';
import 'package:nexreads/app/components/searchInput.dart';
import 'package:nexreads/app/data/models/response_buku.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nexreads/app/modules/book/controllers/book_controller.dart';
import 'package:nexreads/app/routes/app_pages.dart';
import 'package:get/get.dart';

class bookSearch extends StatelessWidget {
  const bookSearch({
    super.key,
    required this.data,
    required this.controller,
  });

  final List<DataBuku> data;
  final BookController controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyInputSearch(
            prefixIcon: Icons.search,
            validator: controller.validator,
            controller: controller,
            controllerField: controller.search,
            height: 10,
            width: 10,
            hintText: "Search Book",
            autoFocus: false,
          ),
        ),
        Obx(
          () => controller.searchLenght.value == 1
              ? controller.loading.value == false
                  ? controller.listDataBuku.isEmpty
                      ? const Center(child: Text("Tidak Ada Buku"))
                      : BookSearch(data: controller.listDataBuku)
                  : const Center(child: CircularProgressIndicator())
              : Column(
                  children: data.map((e) => MyBuku(data: e.buku)).toList(),
                ),
        ),
      ]),
    );
  }
}

class MyBuku extends StatelessWidget {
  const MyBuku({super.key, required this.data});
  final List<Buku>? data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 5 / 8,
            mainAxisSpacing: 30,
            crossAxisSpacing: 30),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Get.toNamed(Routes.DETAILBOOK,
                parameters: {"idbook": data![index].bukuID.toString()}),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image:
                              NetworkImage(data![index].coverBuku.toString()),
                          fit: BoxFit.fill),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

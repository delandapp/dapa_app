import 'package:dio/dio.dart';
import 'package:nexreads/app/data/constans/endpoint.dart';
import 'package:nexreads/app/data/models/response_bookPopular.dart';
import 'package:nexreads/app/data/models/response_koleksi.dart';
import 'package:nexreads/app/data/models/response_buku.dart';
import 'package:nexreads/app/data/provider/api_provider.dart';
import 'package:nexreads/app/data/provider/storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MyState<T1,T2,T3> {
  T1? state1;
  T2? state2;
  T3? state3;
  MyState({this.state1,this.state2,this.state3});
}
class HomeController extends GetxController with StateMixin<MyState<List<DataKoleksi>, List<DataBuku>,List<DataBookPopular>>>{
  //TODO: Implement HomeController
  final RxString username = StorageProvider.read(StorageKey.username).obs;
  TextEditingController search = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
   Future<void> getData() async{
    change(null, status: RxStatus.loading());

    try {
        final bearerToken = StorageProvider.read(StorageKey.bearerToken);
        final idUser = StorageProvider.read(StorageKey.idUser);
        final response = await ApiProvider.instance().get(Endpoint.book,options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
        final responsePopular = await ApiProvider.instance().get(Endpoint.popular,options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
        final responseKoleksiData = await ApiProvider.instance().get('${Endpoint.koleksi}/${idUser}',options: Options(headers: {"Authorization": "Bearer $bearerToken"}));
        if (responseKoleksiData.statusCode == 200) {
          final ResponseBuku responseBuku = ResponseBuku.fromJson(response.data);
          final ResponseKoleksi responseKoleksi = ResponseKoleksi.fromJson(responseKoleksiData.data);
          final ResponseBookPopular responseBookPopular = ResponseBookPopular.fromJson(responsePopular.data);
          if(responseBuku.data!.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            final newData = MyState(state1: responseKoleksi.data, state2: responseBuku.data,state3: responseBookPopular.data);
            change(newData, status: RxStatus.success());
          }
        } else {
          change(null, status: RxStatus.error("Gagal mengambil data"));
        }

    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}

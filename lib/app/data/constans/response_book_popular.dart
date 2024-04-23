/// Status : 200
/// Message : "Berhasil Menampilkan All Buku"
/// data : [{"BukuID":27,"CoverBuku":"http://127.0.0.1:8000/storage/images/coverbook/After Hourse.jpeg","Judul":"After Hourse","Penulis":"Anisa Ramadani","Penerbit":"Athila davin","TahunTerbit":"2024","JumlahHalaman":"214","Rating":3,"Total_ulasan":2,"JumlahRating":6,"JumlahPeminjam":0,"Kategori":["Horor"]}]

class ResponseBookPopular {
  ResponseBookPopular({
      this.status, 
      this.message, 
      this.data,});

  ResponseBookPopular.fromJson(dynamic json) {
    status = json['Status'];
    message = json['Message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBookPopular.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<DataBookPopular>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Status'] = status;
    map['Message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// BukuID : 27
/// CoverBuku : "http://127.0.0.1:8000/storage/images/coverbook/After Hourse.jpeg"
/// Judul : "After Hourse"
/// Penulis : "Anisa Ramadani"
/// Penerbit : "Athila davin"
/// TahunTerbit : "2024"
/// JumlahHalaman : "214"
/// Rating : 3
/// Total_ulasan : 2
/// JumlahRating : 6
/// JumlahPeminjam : 0
/// Kategori : ["Horor"]

class DataBookPopular {
  DataBookPopular({
      this.bukuID, 
      this.coverBuku, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.tahunTerbit, 
      this.jumlahHalaman, 
      this.rating, 
      this.totalUlasan, 
      this.jumlahRating, 
      this.jumlahPeminjam, 
      this.kategori,});

  DataBookPopular.fromJson(dynamic json) {
    bukuID = json['BukuID'];
    coverBuku = json['CoverBuku'];
    judul = json['Judul'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    tahunTerbit = json['TahunTerbit'];
    jumlahHalaman = json['JumlahHalaman'];
    rating = json['Rating'].toDouble();
    totalUlasan = json['Total_ulasan'];
    jumlahRating = json['JumlahRating'];
    jumlahPeminjam = json['JumlahPeminjam'];
    kategori = json['Kategori'] != null ? json['Kategori'].cast<String>() : [];
  }
  int? bukuID;
  String? coverBuku;
  String? judul;
  String? penulis;
  String? penerbit;
  String? tahunTerbit;
  String? jumlahHalaman;
  double? rating;
  int? totalUlasan;
  int? jumlahRating;
  int? jumlahPeminjam;
  List<String>? kategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BukuID'] = bukuID;
    map['CoverBuku'] = coverBuku;
    map['Judul'] = judul;
    map['Penulis'] = penulis;
    map['Penerbit'] = penerbit;
    map['TahunTerbit'] = tahunTerbit;
    map['JumlahHalaman'] = jumlahHalaman;
    map['Rating'] = rating;
    map['Total_ulasan'] = totalUlasan;
    map['JumlahRating'] = jumlahRating;
    map['JumlahPeminjam'] = jumlahPeminjam;
    map['Kategori'] = kategori;
    return map;
  }

}
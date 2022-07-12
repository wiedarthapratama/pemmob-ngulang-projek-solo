class KabupatenModel {
  List<Kabupaten>? data;

  KabupatenModel({this.data});

  KabupatenModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Kabupaten>[];
      json['data'].forEach((v) {
        data!.add(new Kabupaten.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Kabupaten {
  int? idKota;
  int? idProvinsi;
  String? tipe;
  String? kota;
  String? postalCode;

  Kabupaten(
      {this.idKota, this.idProvinsi, this.tipe, this.kota, this.postalCode});

  Kabupaten.fromJson(Map<String, dynamic> json) {
    idKota = json['id_kota'];
    idProvinsi = json['id_provinsi'];
    tipe = json['tipe'];
    kota = json['kota'];
    postalCode = json['postal_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_kota'] = this.idKota;
    data['id_provinsi'] = this.idProvinsi;
    data['tipe'] = this.tipe;
    data['kota'] = this.kota;
    data['postal_code'] = this.postalCode;
    return data;
  }
}

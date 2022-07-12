import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:pemob_project/helper.dart';
import 'package:http/http.dart' as http;
import 'package:pemob_project/models/kabupaten_model.dart';
import 'package:pemob_project/models/ongkir_model.dart';
import 'package:pemob_project/models/page_model.dart';
import 'package:pemob_project/widgets/drawer_widget.dart';

class CekOngkirPage extends StatefulWidget {
  final String linkNya;
  const CekOngkirPage({Key? key, required this.linkNya}) : super(key: key);

  @override
  _CekOngkirPageState createState() => _CekOngkirPageState();
}

class _CekOngkirPageState extends State<CekOngkirPage> {
  PageModel pageModel = PageModel();
  KabupatenModel kabupatenModel = KabupatenModel();
  OngkirModel ongkirModel = OngkirModel();

  bool isLoading = true;

  String provinsiVal = "";
  String kabupatenVal = "";

  getDataDetail() async {
    print('response url: https://bigsport.id/api/page/cek-ongkir');
    var url = Uri.parse('https://bigsport.id/api/page/cek-ongkir');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    setState(() {
      pageModel = PageModel.fromJson(jsonDecode(response.body));
      isLoading = false;
    });
  }

  getKabupaten() async {
    print('response url: https://bigsport.id/api/get_kabupaten/$provinsiVal');
    var url = Uri.parse('https://bigsport.id/api/get_kabupaten/$provinsiVal');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    setState(() {
      kabupatenModel = KabupatenModel.fromJson(jsonDecode(response.body));
      kabupatenVal = "";
    });
  }

  getOngkir() async {
    print('response url: https://bigsport.id/api/get_ongkir_jne/$kabupatenVal');
    var url = Uri.parse('https://bigsport.id/api/get_ongkir_jne/$kabupatenVal');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    setState(() {
      ongkirModel = OngkirModel.fromJson(jsonDecode(response.body));
    });
  }

  @override
  void initState() {
    getDataDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Image.network(
          "https://bigsport.id/images/bsd.png",
          width: 100,
        ),
      ),
      drawer: DrawerWidget(key: widget.key),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          "https://bigsport.id/images/uploads/${pageModel.page!.thumbnail}",
                          width: Get.width,
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Cek Ongkir',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    detailNya()
                  ]),
            ),
    );
  }

  Widget detailNya() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Cek Ongkir',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: Get.width,
            height: 50,
            child: Row(
              children: [
                Text('Kirim Ke'),
                SizedBox(width: 30),
                Container(
                  width: Get.width * 0.7,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: provinsiVal != "" ? provinsiVal : null,
                      itemHeight: null,
                      items: pageModel.provinsi!.map((provinsi) {
                        return DropdownMenuItem<String>(
                          value: provinsi.idProvinsi.toString(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(provinsi.provinsi ?? '-'),
                          ),
                        );
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          provinsiVal = val ?? "";
                        });
                        getKabupaten();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          kabupatenModel.data != null
              ? Container(
                  width: Get.width,
                  height: 50,
                  child: Row(
                    children: [
                      Text(
                        'Kirim Ke',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: 30),
                      Container(
                        width: Get.width * 0.7,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: kabupatenVal != "" ? kabupatenVal : null,
                            itemHeight: null,
                            items: kabupatenModel.data!.map((kabupaten) {
                              return DropdownMenuItem<String>(
                                value: kabupaten.idKota.toString(),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      '${kabupaten.tipe} ${kabupaten.kota}'),
                                ),
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                kabupatenVal = val ?? "";
                              });
                              getOngkir();
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
          ongkirModel.rajaongkir != null
              ? Text(
                  'Ongkir Rp.${noSimbolInUSFormat.format(ongkirModel.rajaongkir?.results![0].costs![0].cost![0].value)}')
              : Container()
        ],
      ),
    );
  }
}

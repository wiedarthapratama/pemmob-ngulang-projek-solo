import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:pemob_project/helper.dart';
import 'package:pemob_project/models/detail_model.dart';
import 'package:http/http.dart' as http;
import 'package:pemob_project/widgets/drawer_widget.dart';

class DetailPage extends StatefulWidget {
  final String linkNya;
  const DetailPage({Key? key, required this.linkNya}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DetailModel detailModel = DetailModel();

  bool isLoading = true;

  getDataDetail() async {
    print('response url: https://bigsport.id/api/product/${widget.linkNya}');
    var url = Uri.parse('https://bigsport.id/api/product/${widget.linkNya}');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    setState(() {
      detailModel = DetailModel.fromJson(jsonDecode(response.body));
      isLoading = false;
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
                    Image.network(
                        "https://bigsport.id/images/uploads/${detailModel.product!.thumbnail}"),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            detailModel?.product?.title ?? '-',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
              'Rp' +
                      noSimbolInUSFormat
                          .format(detailModel.product!.option!.beginPrice) ??
                  '-',
              style: TextStyle(
                fontSize: 14,
                decoration: TextDecoration.lineThrough,
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            'Rp' +
                    noSimbolInUSFormat
                        .format(detailModel.product!.option!.price) ??
                '-',
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
          SizedBox(
              width: Get.width,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Beli Sekarang'),
                    ],
                  ))),
          SizedBox(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.whatsapp),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Order Via Whatsapp')
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
              )),
          Html(data: detailModel.product!.excerpt)
        ],
      ),
    );
  }
}

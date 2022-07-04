import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:pemob_project/helper.dart';
import 'package:http/http.dart' as http;
import 'package:pemob_project/models/page_model.dart';
import 'package:pemob_project/widgets/drawer_widget.dart';

class TrackingPage extends StatefulWidget {
  final String linkNya;
  const TrackingPage({Key? key, required this.linkNya}) : super(key: key);

  @override
  _TrackingPageState createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  PageModel pageModel = PageModel();

  bool isLoading = true;

  getDataDetail() async {
    print('response url: https://bigsport.id/api/page/tracking');
    var url = Uri.parse('https://bigsport.id/api/page/tracking');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    setState(() {
      pageModel = PageModel.fromJson(jsonDecode(response.body));
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
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                  Stack(
                    children: [
                      Image.network(
                          "https://bigsport.id/images/uploads/${pageModel.page!.thumbnail}"),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Tracking',
                            style: TextStyle(color: Colors.white, fontSize: 24),
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
            'Silakan masukan kode invoice number anda di bawah ini',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: Get.width * 0.5,
                child: TextFormField(
                    decoration: InputDecoration(
                  isDense: true,
                  label: Text('Invoice Number'),
                  focusedBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                )),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text('Track Order'),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

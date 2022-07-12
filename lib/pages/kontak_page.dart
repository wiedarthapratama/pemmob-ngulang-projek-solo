import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:pemob_project/helper.dart';
import 'package:http/http.dart' as http;
import 'package:pemob_project/models/page_model.dart';
import 'package:pemob_project/widgets/drawer_widget.dart';

class KontakPage extends StatefulWidget {
  final String linkNya;
  const KontakPage({Key? key, required this.linkNya}) : super(key: key);

  @override
  _KontakPageState createState() => _KontakPageState();
}

class _KontakPageState extends State<KontakPage> {
  PageModel pageModel = PageModel();

  bool isLoading = true;

  getDataDetail() async {
    print('response url: https://bigsport.id/api/page/kontak');
    var url = Uri.parse('https://bigsport.id/api/page/kontak');
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
          : SingleChildScrollView(
              child: Column(
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
                              'Kontak',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Html(data: pageModel.page?.content),
          SizedBox(
            height: 20,
          ),
          Text(
            'Kirim Kami Pesan',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              decoration: InputDecoration(
            labelText: "Name",
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
          )),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              decoration: InputDecoration(
            labelText: "Email",
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
          )),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              decoration: InputDecoration(
            labelText: "Subject",
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 2.0,
              ),
            ),
          )),
          SizedBox(
            height: 10,
          ),
          TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                labelText: "Message",
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                  ),
                ),
              )),
          SizedBox(
              width: Get.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.send),
                    SizedBox(
                      width: 5,
                    ),
                    Text('SEND NOW')
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
              )),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}

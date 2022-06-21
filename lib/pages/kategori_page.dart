import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemob_project/helper.dart';
import 'package:pemob_project/models/detail_model.dart';
import 'package:pemob_project/models/kategori_model.dart';
import 'package:http/http.dart' as http;
import 'package:pemob_project/pages/detail_page.dart';

class KategoriPage extends StatefulWidget {
  final String kategoriNya;
  const KategoriPage({Key? key, required this.kategoriNya}) : super(key: key);

  @override
  _KategoriPageState createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  KategoriModel kategoriModel = KategoriModel();

  bool isLoading = true;

  getDataKategori() async {
    print(
        'response url: https://bigsport.id/api/category/${widget.kategoriNya}');
    var url =
        Uri.parse('https://bigsport.id/api/category/${widget.kategoriNya}');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    setState(() {
      kategoriModel = KategoriModel.fromJson(jsonDecode(response.body));
      isLoading = false;
    });
  }

  @override
  void initState() {
    getDataKategori();
    super.initState();
  }

  showBsKategori() {
    return Get.bottomSheet(Container(
      height: 300,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kategori',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Container(
                      color: kategoriModel.categories![i].categorySlug ==
                              widget.kategoriNya
                          ? Colors.blue
                          : Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 4.0),
                        child: Text(
                          kategoriModel.categories![i].categoryName ?? '-',
                          style: TextStyle(
                              color:
                                  kategoriModel.categories![i].categorySlug ==
                                          widget.kategoriNya
                                      ? Colors.white
                                      : Colors.black),
                        ),
                      ),
                    ));
              },
              itemCount: kategoriModel.categories!.length,
            ),
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.network(
          "https://bigsport.id/images/bsd.png",
          width: 100,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ))
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          child: Image.network(
                            "https://bigsport.id/images/uploads/${kategoriModel.category!.categoryImage}",
                            fit: BoxFit.cover,
                            height: 150,
                            width: Get.width,
                          ),
                        ),
                        Positioned(
                          left: 5,
                          bottom: 10,
                          child: Text(
                            kategoriModel?.category?.categoryName ?? '-',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: Get.width * 0.4,
                          child: ElevatedButton(
                              onPressed: () {
                                print('showBsKategori');
                                showBsKategori();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.list),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Kategori'),
                                ],
                              )),
                        ),
                        SizedBox(
                          width: Get.width * 0.4,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.sort),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('Urutkan'),
                                ],
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 2 / 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: kategoriModel.productList?.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => DetailPage(
                                  linkNya:
                                      kategoriModel.productList![index]?.name ??
                                          '-'));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                    "https://bigsport.id/images/uploads/${kategoriModel.productList![index].thumbnail}"),
                                Text(
                                  kategoriModel.productList![index].title ??
                                      '-',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                kategoriModel.productList![index].beginPrice !=
                                        kategoriModel.productList![index].price
                                    ? Row(
                                        children: [
                                          Text(
                                              'Rp' +
                                                      noSimbolInUSFormat.format(
                                                          kategoriModel
                                                              .productList![
                                                                  index]
                                                              .beginPrice) ??
                                                  '-',
                                              style: TextStyle(
                                                fontSize: 10,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Rp' +
                                                    noSimbolInUSFormat.format(
                                                        kategoriModel
                                                            .productList![index]
                                                            .price) ??
                                                '-',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 10),
                                          ),
                                        ],
                                      )
                                    : Text(
                                        'Rp' +
                                                noSimbolInUSFormat.format(
                                                    kategoriModel
                                                        .productList![index]
                                                        .price) ??
                                            '-',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 10),
                                      ),
                              ],
                            ),
                          );
                        }),
                  ]),
            ),
    );
  }
}

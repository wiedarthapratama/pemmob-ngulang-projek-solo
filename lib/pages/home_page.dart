import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pemob_project/helper.dart';
import 'package:pemob_project/models/home_model.dart';
import 'package:pemob_project/pages/detail_page.dart';
import 'package:pemob_project/pages/kategori_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeModel homeModel = HomeModel();

  bool isLoading = true;

  getDataHome() async {
    var url = Uri.parse('https://bigsport.id/api/home');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    setState(() {
      homeModel = HomeModel.fromJson(jsonDecode(response.body));
      isLoading = false;
    });
  }

  @override
  void initState() {
    getDataHome();
    super.initState();
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(height: 140.0),
                      items: homeModel.slider?.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.network(
                                "https://bigsport.id/images/uploads/${i.thumbnail}");
                          },
                        );
                      }).toList(),
                    ),
                    Text('Produk Terbaru', style: TextStyle(fontSize: 16)),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 2 / 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: homeModel.terbaru?.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => DetailPage(
                                  linkNya:
                                      homeModel.terbaru![index]?.name ?? '-'));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                    "https://bigsport.id/images/uploads/${homeModel.terbaru![index].thumbnail}"),
                                Text(
                                  homeModel.terbaru![index].title ?? '-',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                homeModel.terbaru![index].beginPrice !=
                                        homeModel.terbaru![index].price
                                    ? Row(
                                        children: [
                                          Text(
                                              'Rp' +
                                                      noSimbolInUSFormat.format(
                                                          homeModel
                                                              .terbaru![index]
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
                                                        homeModel
                                                            .terbaru![index]
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
                                                    homeModel.terbaru![index]
                                                        .price) ??
                                            '-',
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 10),
                                      ),
                              ],
                            ),
                          );
                        }),
                    Text('Produk Terlaris', style: TextStyle(fontSize: 16)),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 2 / 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: homeModel.terlaris?.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                  "https://bigsport.id/images/uploads/${homeModel.terlaris![index].thumbnail}"),
                              Text(
                                homeModel.terlaris![index].title ?? '-',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              homeModel.terlaris![index].beginPrice !=
                                      homeModel.terlaris![index].price
                                  ? Row(
                                      children: [
                                        Text(
                                            'Rp' +
                                                    noSimbolInUSFormat.format(
                                                        homeModel
                                                            .terlaris![index]
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
                                                      homeModel.terlaris![index]
                                                          .price) ??
                                              '-',
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 10),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      'Rp' +
                                              noSimbolInUSFormat.format(
                                                  homeModel.terlaris![index]
                                                      .price) ??
                                          '-',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 10),
                                    ),
                            ],
                          );
                        }),
                    Text('Produk Utama', style: TextStyle(fontSize: 16)),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 2 / 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: homeModel.allProduk?.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                  "https://bigsport.id/images/uploads/${homeModel.allProduk![index].thumbnail}"),
                              Text(
                                homeModel.allProduk![index].title ?? '-',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              homeModel.allProduk![index].beginPrice !=
                                      homeModel.allProduk![index].price
                                  ? Row(
                                      children: [
                                        Text(
                                            'Rp' +
                                                    noSimbolInUSFormat.format(
                                                        homeModel
                                                            .allProduk![index]
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
                                                      homeModel
                                                          .allProduk![index]
                                                          .price) ??
                                              '-',
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 10),
                                        ),
                                      ],
                                    )
                                  : Text(
                                      'Rp' +
                                              noSimbolInUSFormat.format(
                                                  homeModel.allProduk![index]
                                                      .price) ??
                                          '-',
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 10),
                                    ),
                            ],
                          );
                        }),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return Image.network(
                            "https://bigsport.id/images/uploads/${homeModel.promo![i].thumbnail}");
                      },
                      itemCount: homeModel.promo!.length,
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 2 / 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: homeModel.categories?.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => KategoriPage(
                                  kategoriNya: homeModel
                                          .categories![index]!.categorySlug ??
                                      '-'));
                            },
                            child: Stack(
                              children: [
                                Image.network(
                                    "https://bigsport.id/images/uploads/${homeModel.categories![index].categoryImage}"),
                                Center(
                                  child: Text(
                                    homeModel.categories![index].categoryName ??
                                        '-',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
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

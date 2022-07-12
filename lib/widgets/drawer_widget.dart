import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pemob_project/pages/kontak_page.dart';
import 'package:pemob_project/pages/ongkir_page.dart';
import 'package:pemob_project/pages/tracking_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Bigsport'),
          ),
          ListTile(
            title: const Text('Cek Ongkir'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Get.to(() => CekOngkirPage(linkNya: 'cek-ongkir'));
            },
          ),
          ListTile(
            title: const Text('Tracking'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Get.to(() => TrackingPage(linkNya: 'tracking'));
            },
          ),
          ListTile(
            title: const Text('Contact Us'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Get.to(() => KontakPage(linkNya: 'kontak'));
            },
          ),
        ],
      ),
    );
  }
}

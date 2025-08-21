import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/common/main_page_controller.dart';
import 'package:kind_bridge/constants/colors.dart';
import 'package:kind_bridge/ngo/pages/accepted_donation_page.dart';

class NgoHomePage extends StatelessWidget {
  NgoHomePage({super.key});

  // final mainController = Get.put(MainPageController());
  final scrollIng = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        spacing: 25,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, NGO-Name!",
                textAlign: TextAlign.left,
                style: GoogleFonts.aboreto(
                  color: appDarkGreen(1),
                  fontSize: 30,
                ),
              ),
              Text(
                "Be the change you wish to see in the world; even the smallest act of kindness can create ripples of hope. 🌱",
                textAlign: TextAlign.end,
                style: GoogleFonts.abel(color: appDarkGreen(0.6)),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              Get.to(
                Scaffold(
                  appBar: AppBar(title: Text("Accepted Donations")),
                  body: AcceptedDonationPage(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your contributions",
                  style: GoogleFonts.aBeeZee(
                    color: appDarkGreen(1),
                    fontSize: 20,
                  ),
                ),
                Icon(
                  CupertinoIcons.right_chevron,
                  color: appDarkGreen(1),
                  size: 22,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 300,
            child: PageView(
              scrollDirection: Axis.horizontal,
              controller: scrollIng,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: appDarkGreen(1)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: appDarkGreen(0.8)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: appDarkGreen(0.6)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: appDarkGreen(0.4)),
                ),
              ],
            ),
          ),
          Text(
            "Completed Donations",
            style: GoogleFonts.aBeeZee(color: appDarkGreen(1), fontSize: 20),
          ),
        ],
      ),
    );
  }
}

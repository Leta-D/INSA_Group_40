import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/common/pages/donated_item_full_view.dart';
import 'package:kind_bridge/constants/colors.dart';

Widget donatedFrameWidget() {
  return InkWell(
    onTap: () {
      print("Donation item tapped");
      // Handle tap event
      Get.to(() => DonatedItemFullView());
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: appWhite(1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: appBlack(0.1), blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            color: appBlack(1),
            "assets/icons/kind_bridge_logo.png",
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title",
                style: GoogleFonts.aBeeZee(
                  color: appDarkGreen(1),
                  fontSize: 20,
                ),
              ),
              Text(
                "Catagory",
                style: GoogleFonts.damion(color: appDarkGreen(1), fontSize: 16),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/constants/colors.dart';
import 'package:kind_bridge/donor/widgets/donated_frame_widget.dart';
import 'package:kind_bridge/dummy_donation_item.dart';

class MyDonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Donations",
                  style: GoogleFonts.aBeeZee(
                    color: appDarkGreen(1),
                    fontSize: 24,
                  ),
                ),
                Text(
                  "Thank you for making a difference—one donation at a time.",
                  style: GoogleFonts.damion(
                    color: appDarkGreen(0.7),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenSize.height / 1.3,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (var item in dummyDonations)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: donatedFrameWidget(item),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

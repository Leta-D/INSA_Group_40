import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/constants/colors.dart';
import 'package:kind_bridge/donor/widgets/donated_frame_widget.dart';

class MyDonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Donations",
            style: GoogleFonts.aBeeZee(color: appDarkGreen(1), fontSize: 24),
          ),
          Text(
            "Thank you for making a difference—one donation at a time.",
            style: GoogleFonts.damion(color: appDarkGreen(0.7), fontSize: 16),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          donatedFrameWidget(),
        ],
      ),
    );
  }
}

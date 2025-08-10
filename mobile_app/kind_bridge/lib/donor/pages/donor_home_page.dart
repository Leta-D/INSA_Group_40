import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/constants/colors.dart';

class DonorHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8),
              child: Text(
                "Hello, UserName!",
                style: GoogleFonts.damion(color: appDarkGreen(1), fontSize: 30),
              ),
            ),
            Text(
              "What do you want to donate today",
              style: GoogleFonts.daiBannaSil(
                color: appDarkGreen(0.7),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

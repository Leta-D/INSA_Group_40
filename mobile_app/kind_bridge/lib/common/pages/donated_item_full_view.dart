import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/constants/colors.dart';

class DonatedItemFullView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Donation Item Details",
          style: GoogleFonts.aBeeZee(color: appDarkGreen(1)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Donation Item Title",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.asset(
              "assets/icons/kind_bridge_logo.png",
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              "Description of the donation item goes here. It can be a detailed description that explains the purpose and impact of the donation.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Amount: \$100.00",
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

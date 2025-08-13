import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/common/donation_item.dart';
import 'package:kind_bridge/constants/colors.dart';

class DonatedItemFullView extends StatelessWidget {
  final DonationItem item;
  const DonatedItemFullView({required this.item, super.key});

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
              item.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            item.imageUrl == null
                ? Image.asset(
                  color: appBlack(1),
                  "assets/icons/kind_bridge_logo.png",
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                )
                : Image.network(
                  item.imageUrl!,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
            Text(
              item.description ?? "Discription not provided",
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

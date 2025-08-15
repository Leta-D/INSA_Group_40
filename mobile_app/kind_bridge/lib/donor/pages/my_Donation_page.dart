import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/constants/colors.dart';
import 'package:kind_bridge/donor/widgets/donated_frame_widget.dart';
import 'package:kind_bridge/dummy_donation_item.dart';

class MyDonationPage extends StatelessWidget {
  const MyDonationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenSize.width / 24,
        vertical: screenSize.height / 74,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: screenSize.height / 74),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Donations",
                  style: GoogleFonts.aBeeZee(
                    color: appDarkGreen(1),
                    fontSize: screenSize.width / 15,
                  ),
                ),
                Text(
                  "Thank you for making a difference—one donation at a time.",
                  style: GoogleFonts.damion(
                    color: appDarkGreen(0.7),
                    fontSize: screenSize.width / 22.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Text(
                          "Filter:",
                          style: GoogleFonts.aboreto(
                            color: appDarkGreen(0.7),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DropdownMenu(
                        initialSelection: "all",

                        width: 280,
                        dropdownMenuEntries: [
                          DropdownMenuEntry(value: "all", label: "All"),
                          DropdownMenuEntry(
                            value: "accepted",
                            label: "Accepted",
                          ),
                          DropdownMenuEntry(value: "pending", label: "Pending"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenSize.height / 1.45,
            child: ListView(
              children: [
                for (var item in dummyDonations)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: screenSize.height / 74,
                    ),
                    child: donatedFrameWidget(item),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

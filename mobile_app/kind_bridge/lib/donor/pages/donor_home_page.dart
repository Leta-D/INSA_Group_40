import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/constants/colors.dart';
import 'package:kind_bridge/donor/pages/donate_page.dart';
import 'package:kind_bridge/donor/widgets/donated_frame_widget.dart';
import 'package:kind_bridge/dummy_donation_item.dart';

class DonorHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: screenSize.height,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8),
                child: Text(
                  "Hello, UserName!",
                  style: GoogleFonts.damion(
                    color: appDarkGreen(1),
                    fontSize: 30,
                  ),
                ),
              ),
              Text(
                "What do you want to donate today",
                style: GoogleFonts.daiBannaSil(
                  color: appDarkGreen(0.7),
                  fontSize: 14,
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  color: appDarkGreen(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(height: 250, width: screenSize.width),
              ),

              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: Get.put(() => DonatePage()),
                        style: ButtonStyle(
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 10),
                          ),
                          backgroundColor: WidgetStatePropertyAll(
                            appDarkGreen(1),
                          ),
                        ),
                        icon: Icon(
                          Icons.volunteer_activism,
                          color: appWhite(1),
                          size: 30,
                        ),
                        label: Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Donate Now",
                            style: TextStyle(color: appWhite(1), fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 15),
                child: Text(
                  "Popular Donations",
                  style: GoogleFonts.aboreto(
                    color: appDarkGreen(1),
                    fontSize: 20,
                  ),
                ),
              ),
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
      ),
    );
  }
}

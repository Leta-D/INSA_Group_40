import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/common/main_page_controller.dart';
import 'package:kind_bridge/constants/colors.dart';
import 'package:kind_bridge/donor/controller/donate_controller.dart';
import 'package:kind_bridge/donor/pages/donate_page.dart';
import 'package:kind_bridge/donor/widgets/animated_dashboard.dart';
import 'package:kind_bridge/donor/widgets/donated_frame_widget.dart';
import 'package:kind_bridge/dummy_donation_item.dart';

class DonorHomePage extends StatelessWidget {
  DonorHomePage({super.key});

  final donorController = Get.put(DonateController());
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

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: animatedDashboard(),
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

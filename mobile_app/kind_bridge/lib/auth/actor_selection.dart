import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/auth/auth_controller.dart';
import 'package:kind_bridge/auth/auth_page.dart';
import 'package:kind_bridge/constants/colors.dart';

class ActorSelection extends StatelessWidget {
  ActorSelection({super.key});

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Together, we can build a bridge between need and generosity",
              textAlign: TextAlign.center,
              style: GoogleFonts.permanentMarker(
                color: appDarkGreen(1),
                fontSize: 22,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 15,
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Choose your role and let's create impact",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alumniSans(
                    color: appDarkGreen(1),
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(bottom: 20, top: 40),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(width: 2, color: appDarkGreen(1)),
              ),
              child: InkWell(
                onTap: () {
                  authController.userRole.value = "Donor";
                  print(authController.userRole.value);
                  Get.to(() => AuthPage());
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/icons/person_heart.png",
                        color: appDarkGreen(1),
                        width: 45,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        "I'm a Donor",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.damion(
                          color: appDarkGreen(1),
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.only(top: 20),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(width: 1, color: appDarkGreen(1)),
              ),
              child: InkWell(
                onTap: () {
                  authController.userRole.value = "NGO";
                  print(authController.userRole);
                  Get.to(() => AuthPage());
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Image.asset(
                      //   "assets/icons/volunteer_activism.png",
                      //   color: appDarkGreen(1),
                      //   width: 45,
                      //   fit: BoxFit.cover,
                      // ),
                      Icon(
                        Icons.volunteer_activism,
                        color: appDarkGreen(1),
                        size: 45,
                      ),
                      Text(
                        "I'm an NGO",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.damion(
                          color: appDarkGreen(1),
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

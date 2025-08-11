import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/common/pages/controller/common_controller.dart';
import 'package:kind_bridge/constants/colors.dart';
import 'package:kind_bridge/donor/controller/donate_controller.dart';

class DonatePage extends StatelessWidget {
  final donateController = Get.put(DonateController());
  final commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        height: screenSize.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Post your Donation",
                style: GoogleFonts.aBeeZee(
                  color: appDarkGreen(1),
                  fontSize: 22,
                ),
              ),
              Text(
                "Small acts, when multiplied by millions of people, can transform the world.",
                style: GoogleFonts.damion(
                  color: appDarkGreen(0.7),
                  fontSize: 14,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 242, 248, 244),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 15),
                      child: Text(
                        "Title",
                        style: GoogleFonts.aBeeZee(
                          color: appDarkGreen(1),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Eg: Jackets or 10kg rice bag",
                        hintStyle: GoogleFonts.daiBannaSil(
                          color: appDarkGreen(1),
                        ),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: appDarkGreen(1)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 15),
                      child: Text(
                        "Donation Category",
                        style: GoogleFonts.aBeeZee(
                          color: appDarkGreen(1),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    DropdownMenu(
                      hintText: "Tap to select a donation category",
                      width: 280,
                      dropdownMenuEntries: [
                        DropdownMenuEntry(value: "cloth", label: "label"),
                        DropdownMenuEntry(value: "value", label: "label"),
                        DropdownMenuEntry(value: "value", label: "label"),
                        DropdownMenuEntry(value: "value", label: "label"),
                        DropdownMenuEntry(value: "value", label: "label"),
                        DropdownMenuEntry(value: "value", label: "label"),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        "Tap to uplaod item image",
                        style: GoogleFonts.aBeeZee(
                          color: appDarkGreen(1),
                          fontSize: 18,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder:
                                      (context) => SafeArea(
                                        child: Wrap(
                                          children: [
                                            ListTile(
                                              leading: Icon(
                                                Icons.photo_camera,
                                                color: appDarkGreen(1),
                                              ),
                                              title: Text(
                                                "Take a Photo",
                                                style: GoogleFonts.aBeeZee(
                                                  color: appDarkGreen(1),
                                                  fontSize: 18,
                                                ),
                                              ),
                                              onTap: () async {
                                                Navigator.pop(context);
                                                await commonController
                                                    .pickFromGallery();
                                              },
                                            ),
                                            ListTile(
                                              leading: Icon(
                                                Icons.photo_library,
                                                color: appDarkGreen(1),
                                              ),
                                              title: Text(
                                                "Choose from Gallery",
                                                style: GoogleFonts.aBeeZee(
                                                  color: appDarkGreen(1),
                                                  fontSize: 18,
                                                ),
                                              ),
                                              onTap: () async {
                                                Navigator.pop(context);
                                                await commonController
                                                    .pickFromGallery();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                );
                              },
                              child: Obx(
                                () => Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: appDarkGreen(0.3),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child:
                                      (commonController.selectedImage.value ==
                                              null)
                                          ? Image.asset(
                                            "assets/icons/kind_bridge_logo.png",
                                          )
                                          : Image.file(
                                            commonController
                                                .selectedImage
                                                .value!,
                                          ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30,
                        bottom: 15,
                        left: 15,
                      ),
                      child: Text(
                        "Address",
                        style: GoogleFonts.aBeeZee(
                          color: appDarkGreen(1),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.snackbar(
                          "Selecting Location",
                          "The system will use your current location as donation pickup location!",
                          colorText: appDarkGreen(1),
                          icon: Image.asset(
                            "assets/icons/kind_bridge_logo.png",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        );
                        commonController
                            .getCurrentLocation()
                            .then((position) {
                              donateController.location.value = [
                                position.latitude,
                                position.longitude,
                              ];
                            })
                            .catchError((error) {
                              Get.snackbar(
                                "Error: can't get location",
                                "Failed to get current location: $error",
                                backgroundColor: appRed(0.4),
                                colorText: appWhite(1),
                              );
                            });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: appDarkGreen(1)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Text(
                                donateController.location.value.isEmpty
                                    ? "Tap to select location"
                                    : "X = ${donateController.location.value[0]}, Y = ${donateController.location.value[1]}",
                                style: TextStyle(color: appDarkGreen(1)),
                              ),
                            ),
                            Icon(
                              CupertinoIcons.location_solid,
                              color: appDarkGreen(1),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 160,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Region",
                                hintStyle: GoogleFonts.daiBannaSil(
                                  color: appDarkGreen(1),
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 130,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "City",
                                hintStyle: GoogleFonts.daiBannaSil(
                                  color: appDarkGreen(1),
                                ),
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 15),
                      child: Text(
                        "Availability",
                        style: GoogleFonts.aBeeZee(
                          color: appDarkGreen(1),
                          fontSize: 18,
                        ),
                      ),
                    ),
                    DropdownMenu(
                      hintText: "Select pickup time",
                      width: 280,
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                          value: "morning",
                          label: "Morning (1 am - 4:30 am)",
                        ),
                        DropdownMenuEntry(
                          value: "afternoon",
                          label: "Afternoon (6 pm - 11:30 pm)",
                        ),
                        DropdownMenuEntry(
                          value: "both",
                          label: "Both (Morning or Afternoon)",
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                            activeColor: appDarkGreen(1),
                          ),
                          Text("Post as Anonumus"),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color.fromARGB(255, 5, 48, 18),
                                      const Color.fromARGB(255, 46, 131, 71),
                                      const Color.fromARGB(255, 101, 180, 125),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  "Post Dontion",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.daiBannaSil(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

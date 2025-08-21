import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/constants/colors.dart';
import 'package:kind_bridge/donor/widgets/donated_frame_widget.dart';
import 'package:kind_bridge/dummy_donation_item.dart';
import 'package:kind_bridge/ngo/controller/find_donation_controller.dart';

class FindDonationPage extends StatelessWidget {
  FindDonationPage({super.key});

  final findPageController = Get.put(FindDonationController());

  ButtonStyle dropDownButtonStyle() => ButtonStyle(
    padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    ),
    backgroundColor: WidgetStatePropertyAll(
      const Color.fromARGB(255, 169, 233, 191),
    ),
  );

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
                  "Available Donations",
                  style: GoogleFonts.aBeeZee(
                    color: appDarkGreen(1),
                    fontSize: screenSize.width / 15,
                  ),
                ),
                Text(
                  "Your mission, thier generosity - together Big impact!",
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
                      Obx(
                        () => DropdownMenu(
                          initialSelection: "all",
                          textStyle: TextStyle(color: appDarkGreen(1)),
                          width: 280,
                          onSelected: (value) {
                            findPageController.dropdownSelectedEntity.value =
                                value ?? 'all';
                          },
                          dropdownMenuEntries: [
                            DropdownMenuEntry(
                              value: "all",
                              label: "All",
                              style:
                                  findPageController
                                              .dropdownSelectedEntity
                                              .value ==
                                          'all'
                                      ? dropDownButtonStyle()
                                      : ButtonStyle(),
                            ),
                            DropdownMenuEntry(
                              value: "nearby",
                              label: "Nearby",
                              style:
                                  findPageController
                                              .dropdownSelectedEntity
                                              .value ==
                                          'nearby'
                                      ? dropDownButtonStyle()
                                      : ButtonStyle(),
                            ),
                            DropdownMenuEntry(
                              value: "cloth",
                              label: "Clothes",
                              style:
                                  findPageController
                                              .dropdownSelectedEntity
                                              .value ==
                                          'cloth'
                                      ? dropDownButtonStyle()
                                      : ButtonStyle(),
                            ),
                            DropdownMenuEntry(
                              value: "medical",
                              label: "Medical supplies",
                              style:
                                  findPageController
                                              .dropdownSelectedEntity
                                              .value ==
                                          'medical'
                                      ? dropDownButtonStyle()
                                      : ButtonStyle(),
                            ),
                            DropdownMenuEntry(
                              value: "food",
                              label: "Food",
                              style:
                                  findPageController
                                              .dropdownSelectedEntity
                                              .value ==
                                          'food'
                                      ? dropDownButtonStyle()
                                      : ButtonStyle(),
                            ),
                            DropdownMenuEntry(
                              value: "recent",
                              label: "Recent",
                              style:
                                  findPageController
                                              .dropdownSelectedEntity
                                              .value ==
                                          'recent'
                                      ? dropDownButtonStyle()
                                      : ButtonStyle(),
                            ),
                          ],
                        ),
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

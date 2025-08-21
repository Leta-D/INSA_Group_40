import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/common/pages/controller/common_controller.dart';
import 'package:kind_bridge/common/pages/controller/data_fetching_controller.dart';
import 'package:kind_bridge/common/pages/donated_item_full_view.dart';
import 'package:kind_bridge/constants/colors.dart';
import 'package:kind_bridge/dummy_donation_item.dart';
import 'package:kind_bridge/ngo/controller/app_map_controller.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  MapPage({super.key});

  final AppMapController mapController = Get.put(AppMapController());
  final fetchDataController = Get.put(DataFetchingController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        height: screenSize.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Map Of Donations",
                style: TextStyle(color: appDarkGreen(1), fontSize: 24),
              ),
              Text(
                "This page will show a map with all the donations available in your area. You can click on a donation to see more details and contact the donor. ",
                style: GoogleFonts.damion(color: appDarkGreen(1), fontSize: 16),
              ),
              Container(
                height: 700,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 203, 236, 203),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Obx(() {
                    if (mapController.currentPosition.value == null) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(color: appDarkGreen(1)),
                          Text(
                            "Map is loading...",
                            style: TextStyle(
                              color: appDarkGreen(1),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      );
                    }
                    return FlutterMap(
                      mapController: mapController.mapController,
                      options: MapOptions(
                        initialCenter: mapController.currentPosition.value!,
                        initialZoom: 13.0,
                        onPositionChanged: (_, __) {
                          mapController.followUser = false;
                        },
                      ),

                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://api.maptiler.com/maps/streets/{z}/{x}/{y}.png?key=uZDMgqkvC3iESW0OPRtc",
                          userAgentPackageName:
                              "com.kindbridge.app", // your package name
                        ),

                        // TileLayer(
                        //   urlTemplate:
                        //       "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                        //   userAgentPackageName: "com.example.app",
                        // ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: mapController.currentPosition.value!,
                              width: 40,
                              height: 40,
                              child: Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                            // for (var item in dummyDonations)
                            Marker(
                              point: LatLng(8.8858241, 38.8102253),
                              width: 40,
                              height: 40,
                              child: GestureDetector(
                                onTap: () {
                                  // Handle marker tap
                                  // Get.to(() => DonatedItemFullView(item: item));
                                },
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.blue,
                                  size: 40,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // fetchDataController.fetchDonations(); // Refresh donations
                      Get.snackbar(
                        "Map Refreshed",
                        "The map has been updated with your current location.",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: appDarkGreen(0.4),
                        colorText: appWhite(1),
                      );
                    },

                    label: Text(
                      "Refresh Map",
                      style: TextStyle(color: appWhite(1)),
                    ),
                    icon: Icon(Icons.refresh, color: appWhite(1)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appDarkGreen(1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      mapController.centerMapOnUser();
                    },
                    backgroundColor: appDarkGreen(1),
                    foregroundColor: appWhite(1),
                    tooltip: "Center Map on User Location",
                    child: Icon(Icons.my_location),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

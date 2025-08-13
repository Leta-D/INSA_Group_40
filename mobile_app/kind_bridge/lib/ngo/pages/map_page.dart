import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/common/pages/controller/common_controller.dart';
import 'package:kind_bridge/constants/colors.dart';
import 'package:kind_bridge/ngo/controller/app_map_controller.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  MapPage({super.key});

  final AppMapController mapController = Get.put(AppMapController());

  final fmMapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
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
            height: 500,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 203, 236, 203),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Obx(
                () =>
                    mapController.currentPosition.value == null
                        ? Column(
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
                        )
                        : FlutterMap(
                          mapController: fmMapController,
                          options: MapOptions(
                            initialCenter: mapController.currentPosition.value!,
                            initialZoom: 15.0,
                            // onTap: (tapPosition, latLng) {
                            //   // latLng is the LatLng of the touched point
                            //   print(
                            //     "Tapped at: ${latLng.latitude}, ${latLng.longitude}",
                            //   );

                            //   // Example: store it in your GetX controller
                            //   // mapController.selectedPosition.value = latLng;
                            // },
                          ),

                          children: [
                            TileLayer(
                              urlTemplate:
                                  "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                              userAgentPackageName: "com.example.app",
                            ),
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
                                Marker(
                                  point: LatLng(
                                    8.888989779900689,
                                    38.81055106080113,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.snackbar(
                                        "Location",
                                        "This is a sample location.",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.white,
                                        colorText: Colors.black,
                                      );
                                    },
                                    child: Icon(
                                      Icons.location_on,
                                      color: Colors.blue,
                                      size: 80,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

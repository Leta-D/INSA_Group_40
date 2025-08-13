import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/common/pages/controller/common_controller.dart';
import 'package:kind_bridge/constants/colors.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {

  final mapController = Get.put(MapController());

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
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: mapController.c == 0? Center(
              child: Column(
                children: [
                  CircularProgressIndicator(
                    color: appDarkGreen(1),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Map will be displayed waiting for location access...",
                    style: TextStyle(color: appDarkGreen(1), fontSize: 18),
                  ),
                ],
              ),
            ): FlutterMap(
              options: MapOptions(
                initialCenter: _currentPosition!,
                initialZoom: 15.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(, longitude),
                      width: 80,
                      height: 80,
                      child: const Icon(
                        Icons.my_location,
                        color: Colors.blue,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

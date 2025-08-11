import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class CommonController extends GetxController {
  // Common controller logic can be added here

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, return an error
      return Future.error('Location services are disabled.');
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Request permission if it was denied
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, return an error
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are permanently denied, return an error
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // If permissions are granted, get the current position
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<Position> getCurrentLocation() async {
    try {
      return await _getCurrentLocation();
    } catch (e) {
      // Handle any errors that occur during the location retrieval
      print('Error getting current location: $e');
      Get.snackbar(
        "Location Access Denied",
        "Pleace enable location services and permissions to use this feature.",
      );
      return Future.error('Failed to get current location');
    }
  }
}

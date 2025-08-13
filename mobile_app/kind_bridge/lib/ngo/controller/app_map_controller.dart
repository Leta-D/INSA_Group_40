import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:kind_bridge/common/pages/controller/common_controller.dart';
import 'package:latlong2/latlong.dart';

class AppMapController extends GetxController {
  var currentPosition = Rx<LatLng?>(null);

  final commonController = Get.put(CommonController());

  // Add any additional methods or properties needed for the MapController

  Future<void> _determinePosition() async {
    Position position = await commonController.getCurrentLocation();
    currentPosition.value = LatLng(position.latitude, position.longitude);
  }

  @override
  void onInit() {
    super.onInit();
    _determinePosition();
  }
}

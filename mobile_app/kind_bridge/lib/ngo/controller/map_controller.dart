import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kind_bridge/common/pages/controller/common_controller.dart';
import 'package:latlong2/latlong.dart';

class MapController extends GetxController {
  final commonController = Get.put(CommonController());
  var currentPosition = Rxn<LatLng>();

  @override
  void onInit() {
    super.onInit();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    Position position = await commonController.getCurrentLocation();
    currentPosition.value = LatLng(position.latitude, position.longitude);
  }
}

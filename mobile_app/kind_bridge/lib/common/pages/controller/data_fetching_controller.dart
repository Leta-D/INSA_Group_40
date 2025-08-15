import 'package:get/get.dart';
import 'package:kind_bridge/common/donation_item.dart';
import 'package:kind_bridge/dummy_donation_item.dart';

class DataFetchingController extends GetxController {
  var donatedItems = <DonationItem>[].obs;

  void fetchDonatedItems() {
    // Simulate fetching data from a remote source
    // In a real application, this would be replaced with an API call
    Future.delayed(Duration(seconds: 2), () {
      for (var item in dummyDonations) {
        donatedItems.value.add(item);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    fetchDonatedItems();
  }
}

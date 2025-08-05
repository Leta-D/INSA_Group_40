import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kind_bridge/donor/pages/donor_home_page.dart';
import 'package:kind_bridge/ngo/pages/ngo_home_page.dart';

class MainPageController extends GetxController {
  var userRole = 'Donor';

  final List<Map<String, dynamic>> donorPages = [
    {'icon': CupertinoIcons.home, 'label': "Home", 'target': DonorHomePage()},
    {
      'icon': CupertinoIcons.search,
      'label': "Search",
      'target': DonorHomePage(),
    },
    {
      'icon': CupertinoIcons.person,
      'label': "Profile",
      'target': DonorHomePage(),
    },
    {
      'icon': CupertinoIcons.settings,
      'label': "Setting",
      'target': NgoHomePage(),
    },
  ];

  var currentPageIndex = 0.obs;
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_bridge/common/pages/profile_page.dart';
import 'package:kind_bridge/donor/pages/donate_page.dart';
import 'package:kind_bridge/donor/pages/donor_home_page.dart';
// import 'package:kind_bridge/donor/pages/donor_profile_page.dart';
import 'package:kind_bridge/donor/pages/my_Donation_page.dart';
import 'package:kind_bridge/ngo/pages/accepted_donation_page.dart';
import 'package:kind_bridge/ngo/pages/find_donation_page.dart';
import 'package:kind_bridge/ngo/pages/map_page.dart';
import 'package:kind_bridge/ngo/pages/ngo_home_page.dart';
// import 'package:kind_bridge/ngo/pages/ngo_profile_page.dart';

class MainPageController extends GetxController {
  final List<Map<String, dynamic>> donorPages = [
    {'icon': CupertinoIcons.home, 'label': "Home", 'target': DonorHomePage()},
    {
      'icon': Icons.volunteer_activism_outlined,
      'label': "Donate",
      'target': DonatePage(),
    },
    {
      'icon': Icons.card_giftcard,
      'label': "My Donations",
      'target': MyDonationPage(),
    },
    {
      'icon': CupertinoIcons.bell,
      'label': "Notifications",
      'target': Center(child: Text("Not implimented")),
    },
    {
      'icon': CupertinoIcons.person,
      'label': "Profile",
      'target': ProfilePage(),
    },
  ];

  final List<Map<String, dynamic>> ngoPages = [
    {'icon': CupertinoIcons.home, 'label': "Home", 'target': DonorHomePage()},
    {
      'icon': CupertinoIcons.search,
      'label': "Find Donations",
      'target': FindDonationPage(),
    },
    {
      'icon': Icons.check_circle_outline,
      'label': "Accepted",
      'target': AcceptedDonationPage(),
    },
    {'icon': CupertinoIcons.map, 'label': "Map", 'target': MapPage()},
    {
      'icon': CupertinoIcons.bell,
      'label': "Notifications",
      'target': Center(child: Text("Not implimented")),
    },
    {
      'icon': CupertinoIcons.person,
      'label': "Profile",
      'target': ProfilePage(),
    },
  ];

  final List<Map<String, dynamic>> adminPages = [
    {
      'icon': CupertinoIcons.person,
      'label': "Profile",
      'target': ProfilePage(),
    },
    {
      'icon': CupertinoIcons.person,
      'label': "Profile",
      'target': ProfilePage(),
    },
  ];

  var userRole = "Donor".obs;
  var currentPageIndex = 0.obs;

  // this function will choose drawer pages based on userRole
  List<Map<String, dynamic>> selectDrawerPages() {
    var currentPage;
    switch (userRole.value) {
      case 'Donor':
        print("Donor");
        currentPage = donorPages;
        break;
      case 'NGO':
        print("NGO");
        currentPage = ngoPages;
        break;
      case 'Admin':
        print("Admin");
        currentPage = donorPages;
        break;
      default:
        print("nothing assigned to user role=======================");
        currentPage = null;
        break;
    }
    return currentPage;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kind_bridge/constants/colors.dart';

class WidgetController extends GetxController {
  late PageController pageController;
  final currentPage = 1.0.obs;

  final List<Color> items = List.generate(5, (index) => appDarkGreen(0.4));

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.5, // shows ~3 items
    );
    pageController.addListener(() {
      currentPage.value = pageController.page ?? currentPage.value;
    });
  }

  void handlePageChange(int index) {
    if (index == items.length) {
      // When user reaches the end → jump back to first item
      Future.delayed(Duration(milliseconds: 400), () {
        pageController.jumpToPage(0);
      });
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

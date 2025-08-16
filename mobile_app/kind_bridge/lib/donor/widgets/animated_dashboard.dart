import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:kind_bridge/constants/colors.dart';
import 'package:kind_bridge/donor/controller/widget_controller.dart';

Widget animatedDashboard() {
  final widgetController = Get.put(WidgetController());
  // late PageController _pageController;
  // double _currentPage = 1.0;

  // final List<Color> items = List.generate(5, (index) => appDarkGreen(0.4));

  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController(
  //     initialPage: 1,
  //     viewportFraction: 0.5, // shows ~3 items
  //   );

  //   _pageController.addListener(() {
  //     setState(() {
  //       _currentPage = _pageController.page ?? _currentPage;
  //     });
  //   });
  // }

  // void _handlePageChange(int index) {
  //   if (index == items.length) {
  //     // When user reaches the end → jump back to first item
  //     Future.delayed(Duration(milliseconds: 400), () {
  //       _pageController.jumpToPage(0);
  //     });
  //   }
  // }

  Widget dashBoaredItemFrame(int index) {
    return Container(
      decoration: BoxDecoration(
        color:
            (widgetController.items.length != index)
                ? widgetController.items[index % widgetController.items.length]
                : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child:
          (index != widgetController.items.length)
              ? Image.asset(
                "assets/images/dashboard_image_${index + 1}.jpg",
                fit: BoxFit.cover,
              )
              : SizedBox(),
    );
  }

  return Obx(
    () => Column(
      children: [
        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: widgetController.pageController,
            itemCount: widgetController.items.length + 1,
            onPageChanged: widgetController.handlePageChange,
            itemBuilder: (context, index) {
              double distance =
                  (widgetController.currentPage.value - index).abs();

              double targetScale = 1 - (distance * 0.3).clamp(0.0, 1.0);

              return TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: targetScale, end: targetScale),
                duration: Duration(milliseconds: 300),
                builder: (context, scale, child) {
                  return Transform.scale(scale: scale, child: child);
                },
                child: InkWell(
                  onTap: () {
                    print(widgetController.currentPage.value);
                    showDialog(
                      useRootNavigator: true,
                      useSafeArea: true,
                      context: context,
                      builder:
                          (_) => Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 140.0,
                              horizontal: 30,
                            ),
                            child: dashBoaredItemFrame(index),
                          ),
                    );
                  },
                  child: dashBoaredItemFrame(index),
                ),
              );
            },
          ),
        ),

        // for the dotes below the dashboard items
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var item in widgetController.items)
                Container(
                  width: 8,
                  height: 8,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color:
                        ((widgetController.items.indexOf(item) * 1.0) ==
                                widgetController.currentPage.value)
                            ? appDarkGreen(0.8)
                            : appDarkGreen(0.3),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
            ],
          ),
        ),
      ],
    ),
  );
}

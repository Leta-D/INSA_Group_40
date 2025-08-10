import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/auth/auth_controller.dart';
import 'package:kind_bridge/common/main_page_controller.dart';
import 'package:kind_bridge/constants/colors.dart';
import 'package:kind_bridge/donor/pages/donor_home_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final mainControler = Get.put(MainPageController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    mainControler.userRole.value = authController.userRole.value;

    Size screenSize = MediaQuery.sizeOf(context);
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: Text('Main Page', style: TextStyle(color: appDarkGreen(1))),
          iconTheme: IconThemeData(color: appDarkGreen(1)),
        ),
        drawer: Drawer(
          backgroundColor: appWhite(1),
          child: ListView(
            children: [
              InkWell(
                onTap: () => Get.back(),

                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color.fromARGB(255, 5, 48, 18),
                        const Color.fromARGB(255, 46, 131, 71),
                        const Color.fromARGB(255, 79, 160, 103),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.clear_circled,
                          size: 30,
                          color: appRed(1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              DrawerHeader(
                duration: Duration(seconds: 1),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 5, 48, 18),
                      const Color.fromARGB(255, 46, 131, 71),
                      const Color.fromARGB(255, 79, 160, 103),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        "assets/icons/kind_bridge_logo.png",
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome, User!',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          Text("70 donated"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // for (var item
              //     in (mainControler.userRole.value == "Donor"
              //         ? mainControler.donorPages
              //         : mainControler.ngoPages))
              for (var item in mainControler.selectDrawerPages())
                ListTile(
                  title: Row(
                    children: [
                      Icon(item['icon']),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          item['label'],
                          style: GoogleFonts.aBeeZee(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    print("=======================================leta");
                    print(mainControler.selectDrawerPages().indexOf(item));
                    mainControler.currentPageIndex.value = mainControler
                        .selectDrawerPages()
                        .indexOf(item);
                    Get.back();
                  },
                ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 140.0,
                    left: 18,
                    bottom: 20,
                  ),
                  child: TextButton.icon(
                    style: ButtonStyle(),
                    onPressed: () {},
                    label: Text(
                      "Dark Mode",
                      style: GoogleFonts.aBeeZee(
                        fontSize: 18,
                        color: appDarkGreen(1),
                      ),
                    ),
                    icon: Icon(
                      CupertinoIcons.moon,
                      size: 25,
                      color: appDarkGreen(1),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.only(left: 30)),
                  ),
                  onPressed: () {},
                  label: Text(
                    "Log Out",
                    style: TextStyle(color: appRed(1), fontSize: 18),
                  ),
                  icon: Icon(Icons.logout, color: appRed(1), size: 25),
                ),
              ),
            ],
          ),
        ),

        body:
            // (mainControler.userRole.value == "Donor"
            //     ? mainControler.donorPages
            //     : mainControler.ngoPages)[mainControler
            //     .currentPageIndex
            //     .value]['target'],
            (mainControler.selectDrawerPages())[mainControler
                .currentPageIndex
                .value]['target'],
      ),
    );
  }
}

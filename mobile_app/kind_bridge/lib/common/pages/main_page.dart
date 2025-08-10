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
  // final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    // mainControler.init(authController.userRole.value);

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
                    // CircleAvatar(
                    //   radius: 40,
                    //   backgroundImage: AssetImage(
                    //     "asets/icons/person_heart.png",
                    //   ),
                    // ),
                    ClipOval(
                      clipBehavior: Clip.hardEdge,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: appRed(1),
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
              for (var item
                  in (mainControler.userRole.value == "Donor"
                      ? mainControler.donorPages
                      : mainControler.ngoPages))
                ListTile(
                  title: Row(
                    children: [
                      Icon(item['icon']),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          item['label'],
                          style: GoogleFonts.monofett(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    print(
                      "========================================================leta",
                    );
                    print(mainControler.donorPages.indexOf(item));
                    mainControler.currentPageIndex.value = mainControler
                        .donorPages
                        .indexOf(item);
                    Get.back();
                  },
                ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 210.0,
                    left: 20,
                    bottom: 10,
                  ),
                  child: TextButton.icon(
                    style: ButtonStyle(),
                    onPressed: () {},
                    label: Text("Dark Mode"),
                    icon: Icon(CupertinoIcons.moon),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  style: ButtonStyle(
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.only(left: 20),
                    ),
                  ),
                  onPressed: () {},
                  label: Text("Log Out", style: TextStyle(color: appRed(1))),
                  icon: Icon(CupertinoIcons.clear, color: appRed(1)),
                ),
              ),
            ],
          ),
        ),

        body:
            (mainControler.userRole.value == "Donor"
                ? mainControler.donorPages
                : mainControler.ngoPages)[mainControler
                .currentPageIndex
                .value]['target'],
      ),
    );
  }
}

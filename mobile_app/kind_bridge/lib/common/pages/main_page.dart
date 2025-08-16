import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kind_bridge/auth/actor_selection.dart';
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

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    Size screenSize = MediaQuery.sizeOf(context);
    return Obx(
      () => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leadingWidth: 60,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: InkWell(
              onTap: () => _scaffoldKey.currentState!.openDrawer(),
              child: ClipOval(
                child: Image.asset(
                  "assets/icons/kind_bridge_logo.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          toolbarHeight: 70,
          title: Text(
            'Kind Bridge',
            style: GoogleFonts.aboreto(
              color: appDarkGreen(1),
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: IconThemeData(color: appDarkGreen(1)),
        ),
        drawer: Drawer(
          backgroundColor: appWhite(1),
          child: ListView(
            children: [
              // InkWell(
              //   onTap: () => Get.back(),

              //   child: Container(
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //         colors: [
              //           const Color.fromARGB(255, 5, 48, 18),
              //           const Color.fromARGB(255, 46, 131, 71),
              //           const Color.fromARGB(255, 79, 160, 103),
              //         ],
              //       ),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 10.0, top: 10),
              //       child: Row(
              //         children: [
              //           Icon(
              //             CupertinoIcons.clear_circled,
              //             size: 30,
              //             color: appRed(1),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: DecoratedBox(
                    decoration:
                        (mainControler.selectDrawerPages().indexOf(item) ==
                                mainControler.currentPageIndex.value)
                            ? BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(color: appDarkGreen(1)),
                              // color: Color.fromARGB(255, 195, 243, 209),
                              gradient: LinearGradient(
                                colors: [
                                  const Color.fromARGB(255, 197, 238, 209),
                                  const Color.fromARGB(255, 134, 238, 165),
                                  const Color.fromARGB(255, 186, 235, 200),
                                ],
                              ),
                            )
                            : BoxDecoration(),
                    child: ListTile(
                      title: Row(
                        children: [
                          Icon(
                            item['icon'],
                            color:
                                (mainControler.selectDrawerPages().indexOf(
                                          item,
                                        ) ==
                                        mainControler.currentPageIndex.value)
                                    ? appBlack(1)
                                    : appBlack(0.6),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              item['label'],
                              style: GoogleFonts.aBeeZee(
                                fontSize: 20,
                                color:
                                    (mainControler.selectDrawerPages().indexOf(
                                              item,
                                            ) ==
                                            mainControler
                                                .currentPageIndex
                                                .value)
                                        ? appBlack(1)
                                        : appBlack(0.6),
                              ),
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        print(mainControler.selectDrawerPages().indexOf(item));
                        mainControler.currentPageIndex.value = mainControler
                            .selectDrawerPages()
                            .indexOf(item);
                        Get.back();
                      },
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 220.0,
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
                  onPressed: () {
                    Get.dialog(
                      AlertDialog(
                        backgroundColor: appWhite(0.85),
                        title: Text(
                          "Log Out",
                          style: GoogleFonts.aBeeZee(color: appDarkGreen(1)),
                        ),
                        content: Text(
                          "Are you sure you want to log out?",
                          style: GoogleFonts.aBeeZee(color: appDarkGreen(1)),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Get.back(),
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.aBeeZee(
                                color: appDarkGreen(1),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // authController.logout();
                              Get.offAll(() => ActorSelection());
                            },
                            child: Text(
                              "Log Out",
                              style: GoogleFonts.aBeeZee(color: appRed(1)),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
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

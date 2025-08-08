import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kind_bridge/constants/colors.dart';

class DonorProfilePage extends StatelessWidget {
  // change the label data with user data from firebase fetched in main_page_controller
  final List<Map<String, dynamic>> accountDetail = [
    {"icon": CupertinoIcons.person, "label": "User Name"},
    {"icon": CupertinoIcons.mail, "label": "User Email"},
    {"icon": CupertinoIcons.phone, "label": "Phone Number"},
    {"icon": Icons.volunteer_activism_sharp, "label": "70 Donated"},
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return SizedBox(
      height: screenSize.height,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,

              child: Container(
                width: screenSize.width,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.elliptical(170, 100),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color.fromARGB(255, 5, 48, 18),
                      const Color.fromARGB(255, 46, 131, 71),
                      const Color.fromARGB(255, 79, 160, 103),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Text(
                      "User Name",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Center(
                    child: ClipOval(
                      clipBehavior: Clip.hardEdge,
                      child: Container(
                        width: 100,
                        height: 100,
                        color: appRed(1),
                      ),
                    ),
                  ),
                  Text(
                    "Donor",
                    style: TextStyle(color: appDarkGreen(1), fontSize: 16),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text(
                        "    Bio    .",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          backgroundColor: appDarkGreen(1),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: screenSize.width,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: appDarkGreen(1)),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      "This is my bio ...",
                      style: TextStyle(color: appDarkGreen(1), fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 10),
                    child: Text(
                      "Account Detail",
                      style: TextStyle(color: appDarkGreen(1), fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 113, 206, 136),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        for (var data in accountDetail)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Icon(data["icon"]),
                                ),
                                Text(
                                  data["label"],
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0),
                    child: OutlinedButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(),
                      label: Text(
                        "Edit Profile",
                        style: TextStyle(color: appDarkGreen(1), fontSize: 16),
                      ),
                      icon: Icon(
                        CupertinoIcons.pencil_circle_fill,
                        size: 25,
                        color: appDarkGreen(1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35.0),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Delete Account",
                        style: TextStyle(color: appRed(1), fontSize: 16),
                      ),
                      icon: Icon(
                        Icons.person_remove_alt_1,
                        size: 25,
                        color: appRed(1),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

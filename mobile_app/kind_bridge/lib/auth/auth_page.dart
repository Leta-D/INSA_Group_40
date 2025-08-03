import 'package:flutter/material.dart';
import 'package:kind_bridge/auth/widgets/login_widget.dart';
import 'package:kind_bridge/constants/colors.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: appWhite(1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: screenSize.height / 4.5,
            width: screenSize.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: appBlack(1), blurRadius: 5, spreadRadius: 2),
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              color: appDarkGreen(1),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign Up",
                        style: TextStyle(color: appWhite(1), fontSize: 20),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: appWhite(1), fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: LoginWidget(),
          ),
          Container(
            height: screenSize.height / 9.5,
            width: screenSize.width,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(225, 0, 0, 0),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: appDarkGreen(1),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kind_bridge/constants/colors.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Welcome Back !",
          style: TextStyle(
            color: appDarkGreen(1),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: TextField(
            cursorColor: appDarkGreen(1),
            decoration: InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(color: appDarkGreen(1), fontSize: 20),
              hintText: "Example@gmail.com",
              hintStyle: TextStyle(color: appBlack(0.6)),
              prefixIcon: Icon(
                CupertinoIcons.mail_solid,
                color: appDarkGreen(1),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: appDarkGreen(1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: appDarkGreen(1)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TextField(
            cursorColor: appDarkGreen(1),
            obscureText: true,
            decoration: InputDecoration(
              labelText: "password",
              labelStyle: TextStyle(color: appDarkGreen(1), fontSize: 20),
              hintText: "At least 6 character!",
              hintStyle: TextStyle(color: appBlack(0.7)),
              prefixIcon: Icon(
                CupertinoIcons.lock_fill,
                color: appDarkGreen(1),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: appDarkGreen(1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: appDarkGreen(1)),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Forget Password?",
              style: TextStyle(color: appRed(1), fontSize: 16),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 30.0, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    elevation: WidgetStatePropertyAll(8),
                    backgroundColor: WidgetStatePropertyAll(appDarkGreen(1)),
                    padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
                  ),
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: appWhite(1), fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(color: appDarkGreen(1), width: 50, height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "or Sign In with",
                style: TextStyle(color: appDarkGreen(1), fontSize: 18),
              ),
            ),
            Container(color: appDarkGreen(1), width: 50, height: 2),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {},
          style: ButtonStyle(
            elevation: WidgetStatePropertyAll(8),
            backgroundColor: WidgetStatePropertyAll(appDarkGreen(0.85)),
            padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
          ),
          icon: Icon(CupertinoIcons.alarm_fill, color: appWhite(1)),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Google",
              style: TextStyle(color: appWhite(1), fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}

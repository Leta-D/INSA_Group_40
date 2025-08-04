import 'package:flutter/material.dart';
import 'package:kind_bridge/constants/colors.dart';

class SignupWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Create an Account",
          style: TextStyle(
            color: appDarkGreen(1),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: TextField(
            cursorColor: appDarkGreen(1),
            decoration: InputDecoration(
              labelText: "Name",
              labelStyle: TextStyle(color: appDarkGreen(1), fontSize: 20),
              hintText: "full name",
              hintStyle: TextStyle(color: appBlack(0.6)),
              prefixIcon: Icon(Icons.person, color: appDarkGreen(1)),
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
            decoration: InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(color: appDarkGreen(1), fontSize: 20),
              hintText: "Example@gmail.com",
              hintStyle: TextStyle(color: appBlack(0.6)),
              prefixIcon: Icon(Icons.email, color: appDarkGreen(1)),
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
            decoration: InputDecoration(
              labelText: "Password",
              labelStyle: TextStyle(color: appDarkGreen(1), fontSize: 20),
              hintText: "Atleast 6 characters",
              hintStyle: TextStyle(color: appBlack(0.6)),
              prefixIcon: Icon(Icons.lock, color: appDarkGreen(1)),
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
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
                    backgroundColor: WidgetStatePropertyAll(appDarkGreen(1)),
                  ),

                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: appWhite(1), fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kind_bridge/auth/auth_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(home: Scaffold(body: Center(child: AuthPage())));
  }
}

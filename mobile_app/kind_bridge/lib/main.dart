import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kind_bridge/auth/actor_selection.dart';
import 'package:kind_bridge/auth/auth_page.dart';
import 'package:kind_bridge/common/pages/main_page.dart';
import 'package:kind_bridge/common/pages/profile_page.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(body: Center(child: ActorSelection())),
    );
  }
}

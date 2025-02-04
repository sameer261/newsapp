import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:news/view/bottomnavigationbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: NavigationMenu(),
      debugShowCheckedModeBanner: false,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

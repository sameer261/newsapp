import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/controller/homecontroller.dart';
import 'package:news/utils/colors.dart';
import 'package:news/view/customappbar.dart';
import 'package:news/view/tabbarview_pages/tabbar.dart'; // Import the CustomTabBarView widget

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Homecontroller homecontroller = Get.put(Homecontroller());

    return DefaultTabController(
      length: 5, // Number of tabs
      child: Scaffold(
        backgroundColor: theme,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: const CustomAppBar(), // Use CustomAppBar here
        ),
        body: CustomTabBarView(),

        // Use CustomTabBarView here
      ),
    );
  }
}

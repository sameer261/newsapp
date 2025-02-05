import 'package:flutter/material.dart';
import 'package:news/utils/colors.dart';
import 'package:news/view/tabbarview_pages/allpage/all.dart';
import 'package:news/view/tabbarview_pages/busniess/bussniesspage.dart';
import 'package:news/view/tabbarview_pages/entertainment/entertainment.dart';
import 'package:news/view/tabbarview_pages/sports/sportspage.dart';
import 'package:news/view/tabbarview_pages/top/top.dart';

class CustomTabBarView extends StatelessWidget {
  const CustomTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TabBar placed inside a SingleChildScrollView for horizontal scrolling
        Container(
          color: theme, // TabBar background color
          child: TabBar(
            isScrollable: true, // Allow tabs to scroll horizontally
            dividerColor: theme,
            indicatorColor: red, // Set the color of the tab indicator
            indicatorWeight: 4.0, // Adjust the thickness of the indicator line
            labelColor: Colors.white, // Text color for the selected tab
            unselectedLabelColor:
                Colors.white70, // Text color for unselected tabs
            overlayColor: WidgetStateProperty.all(
              red.withOpacity(0.05),
            ), // Red overlay color on hover/selection
            indicatorSize:
                TabBarIndicatorSize.label, // Indicator matches label size
            padding: EdgeInsets.zero, // Remove extra padding around the TabBar
            tabs: [
              Tab(text: "All"),
              Tab(text: "Top"),
              Tab(text: "Entertainment"),
              Tab(text: "Busniess"),
              Tab(text: "Sports"),
            ],
          ),
        ),
        // TabBarView with content
        Expanded(
          child: TabBarView(
            children: [
              All(),
              Top(),
              Entertainment(),
              Bussniesspage(),
              Sports(),
            ],
          ),
        ),
      ],
    );
  }
}

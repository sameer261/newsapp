import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:news/controller/bottomnavigationcontroller.dart';
import 'package:news/utils/colors.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final BottomNavigationController controller =
        Get.put(BottomNavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: (index) => controller.selectedIndex.value = index,
          selectedItemColor: Colors.white, // Color for selected item
          unselectedItemColor: Color(0xFF595959), // Color for unselected item
          backgroundColor: theme, // Custom background color
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Iconsax.home_copy,
                color: controller.selectedIndex.value == 0
                    ? Colors.white
                    : Color(0xFF595959),
              ),
              label: 'Feeds', // Use plain text for the label
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_border,
                color: controller.selectedIndex.value == 1
                    ? Colors.white
                    : Color(0xFF595959),
              ),
              label: 'Saved', // Use plain text for the label
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

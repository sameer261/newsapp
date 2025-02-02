
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:news/utils/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: theme,
      iconTheme: IconThemeData(color: Colors.white),
      leading: IconButton(
        icon: Icon(Iconsax.menu_1_copy),
        onPressed: () {
          // Your menu action here
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Iconsax.search_normal_copy),
          onPressed: () {
            // Your search action here
          },
        ),
        IconButton(
          icon: Icon(Iconsax.notification_copy),
          onPressed: () {
            // Your notification action here
          },
        ),
      ],
    );
  }
}

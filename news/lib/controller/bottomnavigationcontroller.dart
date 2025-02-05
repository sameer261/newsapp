import 'package:get/get.dart';
import 'package:news/view/home.dart';
import 'package:news/view/savedscreen/savedscreen.dart';

class BottomNavigationController extends GetxController {
  // To store the selected index
  var selectedIndex = 0.obs;

  // List of screens to be displayed based on selected index
  final screens = [Home(), Savedscreen()];
}

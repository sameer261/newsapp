import 'package:flutter/material.dart';
import 'package:news/utils/colors.dart';

class Savedscreen extends StatelessWidget {
  const Savedscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme,
      appBar: AppBar(
        backgroundColor: theme,
        title: Text(
          'Saved screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

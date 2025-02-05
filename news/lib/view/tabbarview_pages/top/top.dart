import 'package:flutter/material.dart';
import 'package:news/view/tabbarview_pages/allpage/allnews.dart';

class Top extends StatelessWidget {
  const Top({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Allnews(),
    );
  }
}

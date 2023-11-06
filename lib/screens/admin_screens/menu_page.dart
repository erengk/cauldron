import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../utils/customColors.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        title: Text('Menü'),
    backgroundColor: CustomColors.scaffoldBackgroundColor,
    ),
    backgroundColor: CustomColors.bodyBackgroundColor,
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: CustomColors.bodyBackgroundColor,
        color: CustomColors.scaffoldBackgroundColor,
        animationDuration: Duration(milliseconds: 300),
        onTap:(index) {
          debugPrint("Current Index is $index");
        },
        items:[
          Icon(
            Icons.home,
            color: CustomColors.loginButtonTextColor,
          ),
          Icon(
            Icons.list,
            color: CustomColors.loginButtonTextColor,
          ),
        ],
      ),
    );
  }
}

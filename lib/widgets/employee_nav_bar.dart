import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../utils/customColors.dart';

class EmployeeNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const EmployeeNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  State<EmployeeNavBar> createState() => _EmployeeNavBarState();
}

class _EmployeeNavBarState extends State<EmployeeNavBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: CustomColors.bodyBackgroundColor,
      color: CustomColors.scaffoldBackgroundColor,
      animationDuration: const Duration(milliseconds: 300),
      index: widget.currentIndex,
      onTap: widget.onTap,
      items: [
        Icon(
          Icons.restaurant_menu,
          size: 30,
          color: CustomColors.bodyBackgroundColor,
        ),
        Icon(
          Icons.table_restaurant_rounded,
          size: 30,
          color: CustomColors.bodyBackgroundColor,
        ),
      ],
    );
  }
}

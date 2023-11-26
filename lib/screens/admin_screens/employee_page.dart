import 'package:cauldron/screens/admin_screens/restaurant_page.dart';
import 'package:cauldron/widgets/employee_nav_bar.dart';
import 'package:flutter/material.dart';
import '../../utils/customColors.dart';
import 'menu_page.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  State<EmployeePage> createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentPage;
    switch (_currentIndex) {
      case 0:
        currentPage = const MenuPage();
        break;
      case 1:
        currentPage = const RestaurantPage();
        break;
      default:
        currentPage = const MenuPage();
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Employee'),
        backgroundColor: CustomColors.scaffoldBackgroundColor,
      ),
      backgroundColor: CustomColors.bodyBackgroundColor,
      body: currentPage,
      bottomNavigationBar: EmployeeNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}


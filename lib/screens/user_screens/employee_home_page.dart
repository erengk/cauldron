import 'package:flutter/material.dart';
import '../../utils/customColors.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../admin_screens/menu_page.dart';
import '../admin_screens/restaurant_page.dart';

class EmployeeHomePage extends StatefulWidget {
  const EmployeeHomePage({super.key});

  @override
  State<EmployeeHomePage> createState() => _EmployeeHomePageState();
}

class _EmployeeHomePageState extends State<EmployeeHomePage> {

  int _currentIndex = 1;

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
        backgroundColor: CustomColors.buttonColors,
        title: const Text('Cauldron'),
      ),
      body: currentPage,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

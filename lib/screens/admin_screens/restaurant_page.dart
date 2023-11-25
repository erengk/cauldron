import 'package:flutter/material.dart';
import '../../utils/customColors.dart';
import '../../widgets/bottom_nav_bar.dart';
import 'menu_page.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
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
          title: Text('Restaurant'),
          backgroundColor: CustomColors.scaffoldBackgroundColor,
        ),
        backgroundColor: CustomColors.bodyBackgroundColor,
        body: currentPage,
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
        ),);
    }
  }
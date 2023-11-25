import 'package:flutter/material.dart';
import '../../utils/customColors.dart';
import '../../widgets/bottom_nav_bar.dart';

class SuperHomePage extends StatefulWidget {
  const SuperHomePage({super.key});

  @override
  State<SuperHomePage> createState() => _SuperHomePageState();
}

class _SuperHomePageState extends State<SuperHomePage> {
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
        currentPage = const SuperHomePage();
        break;
        /*
      case 1:
        currentPage = const MenuPage();
        break;
      case 2:
        currentPage = RestaurantPage();
        break;

         */
      default:
        currentPage = const SuperHomePage();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.buttonColors,
        title: const Text('Cauldron'),
      ),
      backgroundColor: CustomColors.textButtonColor,
      body: currentPage,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

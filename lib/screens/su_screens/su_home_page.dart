import 'package:flutter/material.dart';
import '../../utils/customColors.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../admin_screens/restaurant_page.dart';
import '../admin_screens/user_op_screens/user_op_main_screen.dart';
import '../user_screens/user_menu_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        currentPage = const UserOpMainScreen();
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
        currentPage = const UserOpMainScreen();
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

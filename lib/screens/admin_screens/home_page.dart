import 'package:cauldron/screens/admin_screens/restaurant_page.dart';
import 'package:cauldron/screens/admin_screens/user_op_screens/user_op_main_screen.dart';
import 'package:cauldron/screens/su_screens/su_home_page.dart';
import 'package:flutter/material.dart';
import '../../utils/customColors.dart';
import '../../widgets/bottom_nav_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      case 1:
        currentPage = const HomePage();
        break;
      case 2:
        currentPage = RestaurantPage();
        break;
      default:
        currentPage = const HomePage();
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

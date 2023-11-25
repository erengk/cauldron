import 'package:cauldron/screens/admin_screens/restaurant_page.dart';
import 'package:cauldron/screens/admin_screens/user_op_screens/user_list_screen.dart';
import 'package:cauldron/screens/admin_screens/user_op_screens/user_register_page.dart';
import 'package:flutter/material.dart';
import '../../../utils/customColors.dart';
import '../../../widgets/bottom_nav_bar.dart';


class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

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
        currentPage = const UserRegister();
        break;
      case 1:
        currentPage = const RestaurantPage();
        break;
      case 2:
        currentPage = UserListScreen();
        break;
      default:
        currentPage = const UserRegister();
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

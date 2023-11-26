import 'package:cauldron/screens/admin_screens/user_op_screens/user_list_screen.dart';
import 'package:cauldron/screens/admin_screens/user_op_screens/user_register_page.dart';
import 'package:cauldron/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../../../utils/customColors.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
        currentPage = const UserRegister();
        break;
      case 1:
        currentPage = const UserListScreen();
        break;
      default:
        currentPage = const UserRegister();
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Admin'),
        backgroundColor: CustomColors.scaffoldBackgroundColor,
      ),
      backgroundColor: CustomColors.bodyBackgroundColor,
      body: currentPage,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

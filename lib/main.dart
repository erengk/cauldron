import 'package:cauldron/screens/admin_screens/restaurant_page.dart';
import 'package:cauldron/screens/admin_screens/user_register_page.dart';
import 'package:cauldron/screens/auth/login_page.dart';
import 'package:cauldron/screens/su_screens/register_admin.dart';
import 'package:cauldron/screens/su_screens/su_home_page.dart';
import 'package:cauldron/screens/user_screens/user_menu_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cauldron/utils/customColors.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cauldron',
      routes: {
        "/loginScreen": (context) => LoginScreen(),
        "/homePage": (context) => HomePage(),
        "/userRegister":(context) => UserRegister(),
        "/userMenuPage": (context) => UserMenuPage(),
        "/restaurantPage": (context) => RestaurantPage(),
        "/adminRegisterScreen": (context) => AdminRegisterScreen(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColor,
      ),
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
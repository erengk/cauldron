import 'package:cauldron/screens/admin_screens/user_op_screens/user_list_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cauldron/utils/customColors.dart';
import 'package:cauldron/utils/customTextStyle.dart';

import '../../../widgets/bottom_nav_bar.dart';
import '../menu_page.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({Key? key}) : super(key: key);

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  String firstName = "";
  String id = "11111111111";
  String lastName = "";
  String password = "123456";
  String role = "waiter";

  int _currentIndex = 1;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Widget currentPage;
    switch (_currentIndex) {
      case 0:
        currentPage = const UserRegister();
        break;
      case 1:
        currentPage = const MenuPage();
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
        backgroundColor: CustomColors.scaffoldBackgroundColor,
        title: const Text('Cauldron'),
      ),
      backgroundColor: CustomColors.bodyBackgroundColor,
      body: currentPage,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }

  SingleChildScrollView appBody(double height, String topImage) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText(),
                    userIDTextField(),
                    passwordTextField(),
                    userFirstNameTextField(),
                    userLastNameTextField(),
                    userRoleTextField(),
                    CreateButton(),
                    backToLoginPage()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text titleText() {
    return Text(
      "Welcome, \nPlease Enter Boxes",
      style: CustomTextStyle.titleTextStyle,
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
        } else {
          password = value!;
        }
      },
      onSaved: (value) {
        password = value!;
      },
      style: TextStyle(color: Colors.white),
      decoration: customInputDecoration("Password"),
    );
  }

  TextFormField userFirstNameTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "This area is a required";
        } else {
          firstName = value!;
        }
      },
      onSaved: (value) {
        firstName = value!;
      },
      style: TextStyle(color: Colors.white),
      decoration: customInputDecoration("First Name"),
    );
  }

  TextFormField userLastNameTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "This area is a required";
        } else {
          lastName = value!;
        }
      },
      onSaved: (value) {
        lastName = value!;
      },
      style: TextStyle(color: Colors.white),
      decoration: customInputDecoration("Last Name"),
    );
  }

  TextFormField userRoleTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
        } else {
          role = value!;
        }
      },
      onSaved: (value) {
        role = value!;
      },
      style: TextStyle(color: Colors.white),
      decoration: customInputDecoration("Role"),
    );
  }

  TextFormField userIDTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
        } else {
          id = value!;
        }
      },
      onSaved: (value) {
        id = value!;
      },
      style: TextStyle(color: Colors.white),
      decoration: customInputDecoration("ID"),
    );
  }

  Center CreateButton() {
    return Center(
      child: TextButton(
        onPressed: signIn,
        child: customText(
          "Create new Account",
          CustomColors.textButtonColor,
        ),
      ),
    );
  }

  void signIn() async {
    if (formkey.currentState!.validate()) {
      addToDatabase(id, firstName, lastName, role, password);
    } else {}
  }

  void addToDatabase(String id, String firstName, String lastName, String role,
      String password) async {
    final dbRef = FirebaseDatabase.instance.ref().child('waiters');

    Map<String, String> waiters = {
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'id': id,
      'role': role,
    };

    dbRef.push().set(waiters);
  }

  Center backToLoginPage() {
    return Center(
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, "/loginPage"),
        child: customText(
          "Login Page",
          CustomColors.textButtonColor,
        ),
      ),
    );
  }
  Widget customSizedBox() => SizedBox(
    height: 20,
  );

  Widget customText(String text, Color color) => Text(
    text,
    style: TextStyle(color: color),
  );

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
      ),
    );
  }
}
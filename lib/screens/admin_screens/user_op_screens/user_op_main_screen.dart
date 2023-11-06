import 'package:cauldron/screens/admin_screens/user_op_screens/register_screen.dart';
import 'package:cauldron/screens/admin_screens/user_op_screens/user_list_screen.dart';
import 'package:flutter/material.dart';
import '../../../utils/customColors.dart';

class UserOpMainScreen extends StatefulWidget {
  const UserOpMainScreen({super.key});

  @override
  State<StatefulWidget> createState() => _UserOpMainScreenState();
}

class _UserOpMainScreenState extends State<UserOpMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.textButtonColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegisterScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreen, // 1. buton rengi
              fixedSize: Size(200, 50),
            ),
            child: const Text('Kullanıcı Kayıt Et'),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const UserListScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // 2. buton rengi
                fixedSize: const Size(200, 50)),
            child: const Text('Kullanıcıları Listele'),
          )
        ],
      ),
    );
  }
}

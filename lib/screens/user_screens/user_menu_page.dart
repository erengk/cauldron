import 'package:flutter/material.dart';

import '../../utils/customColors.dart';

class UserMenuPage extends StatelessWidget {
  const UserMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.scaffoldBackgroundColor,
        title: const Text('Menü'),
      ),
      backgroundColor: CustomColors.bodyBackgroundColor,
    );
  }
}

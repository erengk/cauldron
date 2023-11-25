import 'package:cauldron/screens/admin_screens/user_op_screens/user_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cauldron/utils/customColors.dart';
import '../../../service/authentication_service.dart';
import '../../../widgets/bottom_nav_bar.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/popup.dart';
import '../menu_page.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({Key? key}) : super(key: key);

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _idController = TextEditingController();
  final _roleController = TextEditingController();


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
              padding: const EdgeInsets.all(36),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: _idController,
                          decoration:
                          const InputDecoration(labelText: 'TC Kimlik No'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Lütfen bir kimlik numarası girin';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(labelText: 'İsim'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Lütfen bir isim girin';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: _surnameController,
                          decoration: const InputDecoration(labelText: 'Soyisim'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Lütfen bir soyisim girin';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(labelText: 'Şifre'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Lütfen bir şifre girin';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: _phoneController,
                          decoration: const InputDecoration(labelText: 'Telefon No'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Lütfen bir telefon numarası girin';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(labelText: 'E-mail'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Lütfen bir e-mail adresi girin';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          controller: _roleController,
                          decoration: const InputDecoration(labelText: 'Waiter/Cashier'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Lütfen bir rol girin';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    CustomElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final id = _idController.text;
                          final name = _nameController.text;
                          final surname = _surnameController.text;
                          final phone = _phoneController.text;
                          final email = _emailController.text;
                          final password = _passwordController.text;
                          final role = _roleController.text;

                          Map<String, String> keyValues = {
                            'id': id,
                            'name': name,
                            'surname': surname,
                            'phone': phone,
                            'email': email,
                            'password': password,
                            'role': role,
                          };

                          final result = await AuthenticationService()
                              .registerFirebase('users', keyValues);
                          if (result == 'success') {
                            popUp(context, "Kayıt Başarılı",
                                "Kayıt Başarıyla Oluşturuldu");
                          } else {
                          }
                        }
                      },
                      buttonText: 'Kullanıcıyı Kaydet',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
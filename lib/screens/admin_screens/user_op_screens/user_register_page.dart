import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../service/authentication_service.dart';
import '../../../utils/customColors.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/popup.dart';

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
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bodyBackgroundColor,
      body: Padding(
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
                    controller: _emailController,
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

                    // Firebase ile kayıt işlemini gerçekleştir
                    final result = await AuthenticationService()
                        .registerFirebase('users', keyValues);
                    if (result == 'success') {
                      popUp(context, "Kayıt Başarılı",
                          "Kayıt Başarıyla Oluşturuldu");
                    } else {
                      popUp(context, "Kayıt Başarısız",
                          "Kayıt Oluşturulamadı. Lütfen tekrar deneyin");
                    }
                  }
                },
                buttonText: 'Kullanıcıyı Kaydet',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
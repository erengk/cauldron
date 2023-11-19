import 'package:flutter/material.dart';
import '../../../service/authentication_service.dart';
import '../../../utils/customColors.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/popup.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController =
  TextEditingController(); // Telefon numarası için bir TextEditingController
  final _nameController =
  TextEditingController(); // İsim için bir TextEditingController
  final _surnameController =
  TextEditingController(); // Soyisim için bir TextEditingController
  final _idController =
  TextEditingController(); // Soyisim için bir TextEditingController

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
              CustomElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final id = _idController.text;
                    final name = _nameController.text;
                    final surname = _surnameController.text;
                    final phone = _phoneController.text;
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    Map<String, String> keyValues = {
                      'id': id,
                      'name': name,
                      'surname': surname,
                      'phone': phone,
                      'email': email,
                      'password': password,
                    };

                    // Firebase ile kayıt işlemini gerçekleştir
                    final result = await AuthenticationService()
                        .registerFirebase(keyValues);
                    if (result == 'success') {
                      popUp(context, "Kayıt Başarılı",
                          "Kayıt Başarıyla Oluşturuldu");
                    } else {
                      // TODO: Kayıt işlemi başarısız: HATA MESAJI FALAN GÖSTER
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
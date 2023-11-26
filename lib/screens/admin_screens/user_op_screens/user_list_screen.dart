import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../service/authentication_service.dart';
import '../../../utils/customColors.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserList(),
    );
  }
}

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  @override
  Widget build(BuildContext context) {


  final CollectionReference users = AuthenticationService()
      .getCollection('users'); // Firestore collection adını buraya ekleyin.

    return Scaffold(
      backgroundColor: CustomColors.bodyBackgroundColor,
      body: StreamBuilder(
        stream: users.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          var userData = snapshot.data!.docs; // Firestore'dan gelen dökümanlar
          return ListView.builder(
            itemCount: userData.length,
            itemBuilder: (context, index) {
              var user = userData[index].data() as Map<String, dynamic>;
              user['uid'] = userData[index].id;
              // Firestore dökümanı
              return ListTile(
                title: Text(user['name']), // Değiştirilecek alanı belirtin
                subtitle: Text(user['email']),
                onTap: () {
                  // Elemana tıklanınca pop-up açılacak
                  // Pop-up için bir fonksiyon çağırabilirsiniz
                  openPopup(context, user);
                },
              );
            },
          );
        },
      ),
    );
  }

  void openPopup(BuildContext context, Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            item['name'] + ' ' + item['surname'],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Pop-up içeriği burada oluşturulabilir

              TextField(
                controller: TextEditingController(text: item['id']),
                onChanged: (value) {
                  // TextField'dan alınan değeri saklayabilirsiniz
                },
              ),
              const Text(
                "T.C. Kimlik Numarası",
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.left,
              ),

              TextField(
                controller: TextEditingController(text: item['name']),
                onChanged: (value) {
                  // TextField'dan alınan değeri saklayabilirsiniz
                },
              ),
              const Text(
                "İsim",
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.left,
              ),

              TextField(
                controller: TextEditingController(text: item['surname']),
                onChanged: (value) {
                  // TextField'dan alınan değeri saklayabilirsiniz
                },
              ),
              const Text(
                "Soyad",
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.left,
              ),

              TextField(
                controller: TextEditingController(text: item['phone']),
                onChanged: (value) {
                  // TextField'dan alınan değeri saklayabilirsiniz
                },
              ),
              const Text(
                "Telefon Numarası",
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.left,
              ),

              TextField(
                controller: TextEditingController(text: item['email']),
                onChanged: (value) {
                  // TextField'dan alınan değeri saklayabilirsiniz
                },
              ),
              const Text(
                "E-posta",
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.left,
              ),

              TextField(
                controller: TextEditingController(text: item['password']),
                onChanged: (value) {
                  // TextField'dan alınan değeri saklayabilirsiniz
                },
              ),
              const Text(
                "Şifre",
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.left,
              ),
              TextField(
                controller: TextEditingController(text: item['rol']),
                onChanged: (value) {
                  // TextField'dan alınan değeri saklayabilirsiniz
                },
              ),
              const Text(
                "Waiter/Cashier",
                style: TextStyle(fontSize: 10),
                textAlign: TextAlign.left,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Değişiklikleri kaydetmek için Firestore güncellemesi yapabilirsiniz
              },
              child: const Text('Kaydet'),
            ),
            TextButton(
              onPressed: () {
                // Elemanı silmek için bir fonksiyon çağırabilirsiniz
              },
              child: const Text('Sil'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Kapat'),
            ),
          ],
        );
      },
    );
  }
}

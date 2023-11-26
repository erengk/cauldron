import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../service/authentication_service.dart';
import '../../utils/customColors.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TableList(),
    );
  }
}

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  _TableListState createState() => _TableListState();

}

class _TableListState extends State<TableList>{
  @override
  Widget build(BuildContext buildContext){
    final CollectionReference tables = AuthenticationService()
        .getCollection('tables');
    return Scaffold(
      backgroundColor: CustomColors.bodyBackgroundColor,
      body: StreamBuilder(
        stream: tables.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          var tableData = snapshot.data!.docs;
          return ListView.builder(
            itemCount: tableData.length,
            itemBuilder: (context, index) {
              var table = tableData[index].data() as Map<String, dynamic>;
              table['uid'] = tableData[index].id;
              return ListTile(
                title: Text(table['Masa No']),
                onTap: () {
                  openPopup(context, table);
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
            item['Masa No'] + ' ' + item['Adisyon Durumu'],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Pop-up içeriği burada oluşturulabilir

              TextField(
                controller: TextEditingController(text: item['adisyon']),
                onChanged: (value) {
                  // TextField'dan alınan değeri saklayabilirsiniz
                },
              ),
              const Text(
                "Adisyon Durumu",
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

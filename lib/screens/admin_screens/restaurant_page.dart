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

class _TableListState extends State<TableList> {
  @override
  Widget build(BuildContext buildContext) {
    final CollectionReference tables =
        AuthenticationService().getCollection('tables');
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
                title: Text(table['tableId']),
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
            item['tableId'],
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Padding(
            padding: const EdgeInsets.all(.5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller:
                          TextEditingController(text: item['Hamburger']),
                      decoration: const InputDecoration(labelText: 'Hamburger'),
                      onChanged: (value) {
                        item['Hamburger'] =
                            value; // Değiştirilecek alan: item['Hamburger'
                      },
                    ),
                  ),
                ),
                // Pop-up içeriği burada oluşturulabilir
                Expanded(
                  child: Container(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller:
                          TextEditingController(text: item['KöriliTavuk']),
                      decoration:
                          const InputDecoration(labelText: 'Körili Tavuk'),
                      onChanged: (value) {
                        item['KöriliTavuk'] =
                            value; // Değiştirilecek alan: item['Körili Tavuk'
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: TextEditingController(text: item['Pilav']),
                      decoration: const InputDecoration(labelText: 'Pilav'),
                      onChanged: (value) {
                        item['Pilav'] =
                            value; // Değiştirilecek alan: item['Pilav'
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller:
                          TextEditingController(text: item['SomonIzgara']),
                      decoration:
                          const InputDecoration(labelText: 'Somon Izgara'),
                      onChanged: (value) {
                        item['SomonIzgara'] =
                            value; // Değiştirilecek alan: item['Somon Izgara'
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: TextEditingController(text: item['Spagetti']),
                      decoration: const InputDecoration(labelText: 'Spagetti'),
                      onChanged: (value) {
                        item['Spagetti'] =
                            value; // Değiştirilecek alan: item['Spagetti'
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: TextEditingController(text: item['Cupcake']),
                      decoration: const InputDecoration(labelText: 'Cupcake'),
                      onChanged: (value) {
                        item['Cupcake'] =
                            value; // Değiştirilecek alan: item['Cupcake'
                      },
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: TextEditingController(text: item['Pankek']),
                      decoration: const InputDecoration(labelText: 'Pankek'),
                      onChanged: (value) {
                        item['Pankek'] =
                            value; // Değiştirilecek alan: item['Pankek'
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: TextEditingController(text: item['Ramen']),
                      decoration: const InputDecoration(labelText: 'Ramen'),
                      onChanged: (value) {
                        item['Ramen'] =
                            value; // Değiştirilecek alan: item['Ramen'
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TextButton(
                      onPressed: () {
                        CollectionReference db = AuthenticationService()
                            .getCollection(
                                'tables'); // Firestore collection adını buraya ekleyin.
                        db.doc(item['uid']).set(item);
                        // Değişiklikleri kaydetmek için Firestore güncellemesi yapabilirsiniz
                      },
                      child: const Text('Kaydet'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TextButton(
                      onPressed: () {
                        CollectionReference db = AuthenticationService()
                            .getCollection(
                                'tables'); // Firestore collection adını buraya ekleyin.
                        db.doc(item['uid']).delete();
                        Navigator.of(context).pop();
                        // Elemanı silmek için bir fonksiyon çağırabilirsiniz
                      },
                      child: const Text('Sil'),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Kapat'),
                        style: TextButton.styleFrom()),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

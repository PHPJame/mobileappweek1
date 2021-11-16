import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';

class Viwedata extends StatefulWidget {
  const Viwedata({Key? key}) : super(key: key);

  @override
  _ViwedataState createState() => _ViwedataState();
}

class _ViwedataState extends State<Viwedata> {
  //ประกาศตัวแปรอ้างไปยัง Child ที่ต้องการ
  final dbfirebase = FirebaseDatabase.instance.reference().child('Store');

  Future<void> updateData(String key) async {
    try {
      await dbfirebase
          .child(key)
          .update({
            'status': "ขายแล้ว",
          })
          .then((value) => print("Success"))
          .catchError((onError) {
            print(onError.code);
            print(onError.message);
          });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FirebaseAnimatedList(
        query: dbfirebase,
        itemBuilder: (context, snapshot, animetion, index) {
          return Container(
            height: 100,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 10,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.no_food_outlined),
                    backgroundColor: pColor,
                  ),
                  title: Text('${snapshot.value['product']}'),
                  subtitle: Row(
                    children: [
                      Text("ราคา" + '${snapshot.value['price']}'),
                      Text("รายละเอียด" + '${snapshot.value['status']}'),
                    ],
                  ),
                  trailing: Column(
                    children: [
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.delete_forever_outlined),
                          onPressed: () {
                            print("ลบข้อมูล");
                            dbfirebase.child(snapshot.key!).remove();
                          },
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.edit_notifications_outlined),
                          onPressed: () {
                            print("แก้ไขข้อมูล");
                            updateData(snapshot.key!);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

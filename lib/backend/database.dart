import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DBLocal {
  var dbname = "TCT30";

  Future<Database> connectDB() async {
    //หา Path ใน Mobile Device
    var directory = await getApplicationDocumentsDirectory();
    //print(directory);
    var location = join(directory.path, this.dbname);
    //print(location);

    // สร้าง DB File
    var createDB = databaseFactoryIo;
    var db = await createDB.openDatabase(location);
    //print(db);

    return db;
  }

  Future<void> register(name, surename, email, password) async {
    //print('$name, $surename, $email, $password');
    //การเปิด Database
    var db = await this.connectDB();
    //กำหนด store
    var store = intMapStoreFactory.store('user');
    // print(store);

    var user = await store.add(db, {
      'name': name,
      'surename': surename,
      'email': email,
      'password': password,
    });
    print(user);

    await store.find(db).then((response) {
      print(response);
    }).catchError((onError) {
      print(onError);
    });

    db.close();
  }

  Future<bool> login(email, password) async {
    var db = await this.connectDB();
    //กำหนด store
    var store = intMapStoreFactory.store('user');

    var user = await store.find(db);

    for (var item in user) {
      if (item['email'] == email && item['password'] == password) {
        return true;
      }
    }
    return false;
  }
}

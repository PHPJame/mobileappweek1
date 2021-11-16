import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';
import 'package:mobileappweek1/screen/FBlogin.dart';
import 'package:mobileappweek1/screen/Login.dart';

class FBregister extends StatefulWidget {
  const FBregister({Key? key}) : super(key: key);

  @override
  _FBregisterState createState() => _FBregisterState();
}

class _FBregisterState extends State<FBregister> {
  var name, surename, email, password;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("FBRegister"),
        ),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //txtname(),
                //txtsurename(),
                txtemail(),
                txtpassword(),
                //txtConfirmPassword(),
                btnsubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtname() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 20,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Name',
          icon: Icon(
            Icons.account_circle_outlined,
            color: pColor,
          ),
          hintText: 'Input your name',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณาใส่ข้อมูลด้วย';
          } else if (value.length < 2) {
            return 'กรุณากรอกข้อมูลมากกว่า 2 ตัวอักษร';
          }
        },
        onSaved: (value) {
          name = value!.trim();
        },
      ),
    );
  }

  Widget txtsurename() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: TextFormField(
        style: TextStyle(
          fontSize: 20,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Surname',
          icon: Icon(
            Icons.ad_units_outlined,
            color: pColor,
          ),
          hintText: 'Input your Surname',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณาใส่ข้อมูลด้วย';
          } else if (value.length < 2) {
            return 'กรุณากรอกข้อมูลมากกว่า 2 ตัวอักษร';
          }
        },
        onSaved: (value) {
          surename = value!.trim();
        },
      ),
    );
  }

  Widget txtemail() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontSize: 20,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Email',
          icon: Icon(
            Icons.email_outlined,
            color: pColor,
          ),
          hintText: 'Input your Email',
        ),
        validator: (value) {
          if (!(value!.contains('@'))) {
            return 'กรุณากรอกข้อมูลตามรูปแบบอีเมลด้วย';
          } else if (!(value.contains('.'))) {
            return 'กรุณากรอกข้อมูลตามรูปแบบอีเมลด้วย';
          }
        },
        onSaved: (value) {
          email = value!.trim();
        },
      ),
    );
  }

  Widget txtpassword() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(
          fontSize: 20,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Password',
          icon: Icon(
            Icons.lock_clock_outlined,
            color: pColor,
          ),
          hintText: 'Input your Password',
        ),
        //controller: Ppassword,
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณาใส่รหัสผ่านด้วย';
          } else if (value.length < 8) {
            return 'กรุณากรอกข้อมูลมากกว่า 8 ตัว';
          }
        },
        onSaved: (value) {
          password = value!.trim();
        },
      ),
    );
  }

  Widget btnsubmit() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pColor,
        ),
        onPressed: () {
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            registerFB();
          }
        },
        child: Text(
          'Submit',
          style: TextStyle(fontSize: 22),
        ),
      );

  Future<void> registerFB() async {
    try {
      //ส่งข้อมูล Email และ password to firebase
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => FBlogin());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);
      }).catchError((onError) {
        print(onError);
        var msg = '${onError}';
        showAlert(msg);
      });
    } catch (e) {
      //print(e);
    }
  }

  void showAlert(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 48,
              ),
              title: Text(
                "พอข้อผิดพลาด",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                ),
              ),
            ),
            content: Text(message),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("ปิด"),
              )
            ],
          );
        });
  }
}

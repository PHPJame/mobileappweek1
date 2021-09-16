import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var name, surname, email, password;
  final formkey = GlobalKey<FormState>();
  final Ppassword = TextEditingController();
  final Cpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                txtname(),
                txtsurname(),
                txtemail(),
                txtpassword(),
                txtConfirmPassword(),
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
          icon: Icon(Icons.account_circle_outlined),
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

  Widget txtsurname() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: TextFormField(
        style: TextStyle(
          fontSize: 20,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Surname',
          icon: Icon(Icons.ad_units_outlined),
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
          surname = value!.trim();
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
          icon: Icon(Icons.email_outlined),
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
          icon: Icon(Icons.password_outlined),
          hintText: 'Input your Password',
        ),
        controller: Ppassword,
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

  Widget txtConfirmPassword() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 15),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(
          fontSize: 20,
          color: sColor,
        ),
        decoration: InputDecoration(
          labelText: 'ConfirmPassword ',
          icon: Icon(Icons.password_outlined),
          hintText: 'Input your ConfirmPassword',
        ),
        controller: Cpassword,
        validator: (value) {
          if (value!.isEmpty) {
            return 'ยืนยันรหัสผ่าน';
          } else if (value != Ppassword.text) {
            return 'รหัสผ่านไม่ตรงกัน';
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
          print("Hello");
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            print(
                'Name: $name Surname: $surname email: $email password: $password');
            formkey.currentState!.reset();
          }
        },
        child: Text(
          'Submit',
          style: TextStyle(fontSize: 22),
        ),
      );
}

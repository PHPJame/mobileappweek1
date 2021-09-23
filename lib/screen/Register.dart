import 'package:flutter/material.dart';
import 'package:mobileappweek1/backend/database.dart';
import 'package:mobileappweek1/config/constant.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var name, surename, email, password;
  final formkey = GlobalKey<FormState>();
  //final Ppassword = TextEditingController();
  //final Cpassword = TextEditingController();
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
                txtsurename(),
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

/*  Widget txtConfirmPassword() {
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
          icon: Icon(Icons.lock_clock_outlined),
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
*/

  Widget btnsubmit() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pColor,
        ),
        onPressed: () {
          print("Hello");
          var local = new DBLocal();
          if (formkey.currentState!.validate()) {
            formkey.currentState!.save();
            local.register(name, surename, email, password);
            formkey.currentState!.reset();
            Navigator.pushNamed(context, 'Login');
          }
        },
        child: Text(
          'Submit',
          style: TextStyle(fontSize: 22),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobileappweek1/Modal/TCT.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var data;

  @override
  void initState() {
    super.initState();
    print("Hello");
    callAPI();
  }

  Future<void> callAPI() async {
    var url = Uri.parse("https://www.boredapi.com/api/activity");

    var response = await http.get(url);

    setState(() {
      data = tctFromJson(response.body);
    });
    // print(response.statusCode);
    //print(response.body);
    // print(data.activity);
    // print(data.type);
    // print(data.price);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.api),
              SizedBox(width: 10),
              Text('Dashboard'),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text(data?.activity ?? "Loading..."),
              Text(data?.type ?? "Loading..."),
              Text('${data?.price ?? "Loading..."}'),
              Text('${data?.participants ?? "Loading..."}'),
            ],
          ),
        ),
      ),
    );
  }
}

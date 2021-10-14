import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobileappweek1/Modal/TCT.dart';
import 'package:mobileappweek1/config/constant.dart';

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
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: pColor,
                ),
                child: Text(
                  "Menu",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  print("Menu Video");
                  Navigator.pushNamed(context, 'Video');
                },
                title: Text(
                  'Video',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                leading: Icon(
                  Icons.video_collection_outlined,
                  color: Colors.red,
                  size: 36,
                ),
              ),
              ListTile(
                onTap: () {
                  print("Menu Image");
                  Navigator.pushNamed(context, 'Image');
                },
                title: Text(
                  'Imges',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                leading: Icon(
                  Icons.image_outlined,
                  color: Colors.green,
                  size: 36,
                ),
              ),
              ListTile(
                onTap: () {
                  print("Menu Location");
                  Navigator.pushNamed(context, 'Location');
                },
                title: Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                leading: Icon(
                  Icons.gps_fixed_outlined,
                  color: Colors.blue,
                  size: 36,
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.api_outlined),
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

import 'package:donorfinal/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../routes.dart';
import 'OpenView.dart';

class AdHome extends StatefulWidget {
  const AdHome({Key key}) : super(key: key);

  @override
  _AdHomeState createState() => _AdHomeState();
}

class _AdHomeState extends State<AdHome> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final logo = Image.asset(
      "assets/images/icon.png",
      height: mq.size.height / 3.5,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Blood Donor Hub"),
        actions: [
          IconButton(
                    onPressed: () {
                      print("Sign Out Pressed");
                      context.read<FlutterFireAuthService>().signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OpenView(),
                          ),
                          );
                    },
                    icon: Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                      size: 30,
                    ),
              ),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo,
            SizedBox(height: 5),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.redAccent,
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.dash);
                },
                child: Text(
                  "Dashboard",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50),

            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.redAccent,
                border: Border.all(
                  color: Colors.redAccent,
                  width: 2.0,
                ),
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.addonor);
                },
                child: Text(
                  "View Donors",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

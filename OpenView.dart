import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../routes.dart';

class OpenView extends StatelessWidget {
  const OpenView({Key key}) : super(key: key);

  Widget title1(BuildContext context) {
    final clgimage = Image.asset("assets/images/collegelogo.png",
        height: MediaQuery.of(context).size.width / 6.0);
    final nss = Image.asset(
      "assets/images/nsslogo.jpeg",
      height: MediaQuery.of(context).size.width / 8.0,
      //width: MediaQuery.of(context).size.height / 7.0
    );

    return Container(
      padding: EdgeInsets.all(5),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        clgimage,
        Text(
          "Adikavi Nannaya University",
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 18.5,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "\nNational Service Scheme Unit\n",
          style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 18.5,
            fontWeight: FontWeight.bold,
          ),
        ),

        nss,
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget vc1() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/vc.jpg",
            width: 150,
            height: MediaQuery.of(context).size.height / 6.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Text("Prof. M Jagannadha Rao, Vice Chancellor",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
          ),
          SizedBox(height: 2.5),
          Container(
              child: Text(
            ''' Adikavi Nannaya University aims to...
                 ''',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w900),
          ))
        ],
      );
    }

    Widget registrar() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/reg.jpg",
              width: 150, height: MediaQuery.of(context).size.height / 6.0),
          Text("Prof. T Ashok, Registrar(FAC)",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
          SizedBox(height: 2.5),
          Container(
              // height: MediaQuery.of(context).size.height/4.0,
              child: Text(
            ''' Adikavi Nannaya University aims to...
                     ''',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w900),
          ))
        ],
      );
    }

    Widget nsshead() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/mam.jpeg",
              width: 150, height: MediaQuery.of(context).size.height / 6.0),
          Text("Dr.B Kezia Rani,NSS Co-Ordinator",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
          SizedBox(height: 2.5),
          Container(
              child: Text(
            ''' Adikavi Nannaya University aims to...
                 ''',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w900),
          ))
        ],
      );
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Blood Donor Hub"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 60),
              title1(context),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.redAccent,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.search);
                      },
                      child: Text(
                        "Search for Donor",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 60),
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
                        Navigator.of(context).pushNamed(AppRoutes.donor);
                      },
                      child: Text(
                        " DonorLogIn",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 60),
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
                        Navigator.of(context).pushNamed(AppRoutes.admin);
                      },
                      child: Text(
                        " AdminLogIn",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  vc1(),
                  registrar(),
                  nsshead(),
                ],
              ),
            ],
          ),
        ));
  }
}

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:donorfinal/global.dart' as global;


class DDash extends StatefulWidget {
  DDash({Key key}) : super(key: key);

  @override
  _DDashState createState() => _DDashState();
}

class _DDashState extends State<DDash> {
  CollectionReference donor = FirebaseFirestore.instance
      .collection('donner')
      .doc(global.udistrict)
      .collection(global.umandal)
      .doc(global.ubgroup)
      .collection('list');
  // void _launch() async =>
  //     await canLaunch(urlString)

    void _launchCaller(String number)async{
  var url ="tel:$number";

  if(await canLaunch(url)) {
    await launch(url);

  }else{

    throw e ;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Dash Board"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: StreamBuilder(
                  stream: donor.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text('Loading..'),
                      );
                    }
                    return ListView(
                      children: snapshot.data.docs.map((donor) {
                        return Center(
                          /** Card Widget **/
                          child: Card(
                            elevation: 200,
                            shadowColor: Colors.black,
                            color: Colors.red[400],
                            child: SizedBox(
                              width:  MediaQuery.of(context).size.width/1.2,
                                height: MediaQuery.of(context).size.height/4.5,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    /*	CircleAvatar(
					backgroundColor: Colors.green[500],
					radius: 108,
					child: CircleAvatar(
				//	backgroundImage: NetworkImage(
				//		"https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetworkImage
					radius: 100,
					), //CircleAvatar
				), //CirclAvatar*/
                                    SizedBox(
                                      height: 10,
                                    ), //SizedBox
                                    Text(
                                      donor['full_name'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        //	color: Colors.redAccent,
                                        fontWeight: FontWeight.w500,
                                      ), //Textstyle
                                    ), //Text
                                    SizedBox(
                                      height: 10,
                                    ), //SizedBox
                                    Text(
                                      donor['gender'],
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ), //Textstyle
                                    ), //Text
                                    SizedBox(
                                      height: 3,
                                    ), //SizedBox
                                    SizedBox(
                                      width: 150,

                                      child: MaterialButton(
                                        onPressed: ()  {
                                          print(donor["mobile"]);
                                           _launchCaller(donor['mobile']);
                                          
                                            
                                          } ,
                                        color: Colors.green,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(4.0,4.0,1.0,2.0),
                                          child: Row(
                                            children: [
                                              Icon(Icons.touch_app),
                                              Text(donor['mobile']),
                                            ],
                                          ), //Row
                                        ), //Padding
                                      ), //RaisedButton
                                    ) //SizedBox
                                  ],
                                ), //Column
                              ), //Padding
                            ), //SizedBox
                          ), //Card
                        ); //Center
                      }).toList(),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:donorfinal/Screens/buildreqcard.dart';
// import 'package:donorfinal/models/usermodel.dart';
// import 'package:donorfinal/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Dash extends StatefulWidget {
  Dash({Key key}) : super(key: key);

  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  CollectionReference user =
      FirebaseFirestore.instance.collection('personInNeed');
Future<void> _launchCaller(String number)async{
  var url ="tel:$number";
  if(await canLaunch(url)){
    await launch(url);
  }else{
    throw'Cant Launch';
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
                  stream: user.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text('Loading..'),
                      );
                    }
                    return ListView(
                      children: snapshot.data.docs.map((user) {
                        return Center(
                          child: Center(
                            /** Card Widget **/
                            child: Card(
                              elevation: 200,
                              shadowColor: Colors.black,
                              color: Colors.red[400],
                              child: SizedBox(
                                width:  MediaQuery.of(context).size.width/1.2,
                                height: MediaQuery.of(context).size.height/4.5,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical:40.0,horizontal:78.0),
                                  child: Column(
                                    children: [
                                         SizedBox(
                                        height: 10,
                                      ), //SizedBox
                                      Text(
                                        user['full_name'],
                                        style: TextStyle(
                                          fontSize: 20,
                                          //	color: Colors.redAccent,
                                          fontWeight: FontWeight.w500,
                                        ), //Textstyle
                                      ), //Text
                                      SizedBox(
                                        height: 5,
                                      ), //SizedBox
                                      Text(
                                        user['bloodgroup'],
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

                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: MaterialButton(
                                            onPressed: () {
                                              _launchCaller(user['mobile']);
                                            } ,
                                            color: Colors.green,
                                            child: Padding(
                                              padding: const EdgeInsets.fromLTRB(1,1,1,0),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.touch_app),
                                                  Text(user['mobile']),
                                                ],
                                              ), //Row
                                            ), //Padding
                                          ),
                                        ), //RaisedButton
                                      ) //SizedBox
                                    ],
                                  ), //Column
                                ), //Padding
                              ), //SizedBox
                            ), //Card
                          ),
                        );
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

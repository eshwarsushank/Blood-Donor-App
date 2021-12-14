import 'package:flutter/material.dart';
import 'package:donorfinal/global.dart' as global;

import '../routes.dart';

class AdSearch extends StatefulWidget {
  @override
  _AdSearchState createState() => _AdSearchState();
}

class _AdSearchState extends State<AdSearch> {
  String bgroup;
  String uDistrict = 'District';
  String umandal = 'Mandal';
  

  var distric;

  get bloodgroup => null;
  @override
  

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
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              logo,
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20.0),
              //   child: TextFormField(
              //     autofocus: true,
              //     controller: uname,
              //     decoration: InputDecoration(
              //       labelText: "FullName",
              //     ),
              //     validator: (String value) {
              //       if (value.isEmpty) {
              //         return 'Please a Enter fullname';
              //       }
              //       return null;
              //     },
              //   ),
              // ),
             /*Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  autofocus: true,
                  controller: umobile,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "phone number",
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter phone no ';
                    }
                    return null;
                  },
                ),
              ), //ph*/
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                      child: DropdownButton<String>(
                    value: bgroup,
                    icon: const Icon(Icons.arrow_drop_down_circle_sharp),
                    iconSize: 24,
                    elevation: 26,
                    hint: Text('Select a blood group'),
                    style: const TextStyle(color: Colors.redAccent),
                    underline: Container(height: 2, color: Colors.redAccent),
                    onChanged: (String newValue) {
                      setState(() {
                        bgroup = newValue;
                      });
                    },
                    items: <String>[
                      'Blood Group',
                      'A+',
                      'A-',
                      'B+',
                      'B-',
                      'O+',
                      'O-',
                      'AB+',
                      'AB-'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ))),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                      child: Center(
                          child: DropdownButton<String>(
                        value: uDistrict,
                        icon: const Icon(Icons.arrow_drop_down_circle_rounded),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.redAccent),
                        underline: Container(
                          height: 2,
                          color: Colors.redAccent,
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            uDistrict = newValue;
                          });
                        },
                        items: <String>[
                          'District',
                          'East Godavari',
                          'West Godavari'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 20, 20),
                      child: Center(
                          child: DropdownButton<String>(
                        value: umandal,
                        icon: const Icon(Icons.arrow_drop_down_circle_sharp),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.redAccent),
                        underline:
                            Container(height: 2, color: Colors.redAccent),
                        onChanged: (String newValue) {
                          setState(() {
                            umandal = newValue;
                          });
                        },
                        items: <String>[
                          'Mandal',
                          'Anaparthy',
                          'Atreyapuram',
                          'Addateegala',
                          'Ainavilli',
                          'Alamuru',
                          'Allavaram',
                          'Amalapuram',
                          'Ambajipeta',
                          'Biccavolu',
                          'Devipatnam',
                          'Gandepalle',
                          'Gangavaram',
                          'Gokavaram',
                          'Gollaprolu',
                          'I. Polavaram',
                          'Jaggampeta',
                          'Kadiam',
                          'Kajuluru',
                          'Kakinada (Rural)',
                          'Kakinada (Urban)',
                          '	Kapileswarapuram',
                          'Karapa',
                          'Katrenikona',
                          'Kirlampudi',
                          'Korukonda',
                          'Kotananduru',
                          'Kothapalle',
                          'Kothapeta',
                          'Malikipuram',
                          'Mamidikuduru',
                          'Mandapeta',
                          'Maredumilli',
                          'Mummidivaram',
                          'P.Gannavaram',
                          'Pamarru',
                          'Pedapudi',
                          'Peddapuram',
                          '	Pithapuram',
                          'Prathipadu',
                          'Rajahmundry (Urban)',
                          'Rajahmundry Rural',
                          'Rajanagaram',
                          'Rajavommangi',
                          'Ramachandrapuram',
                          'Rampachodavaram',
                          'rangampeta',
                          'Ravulapalem',
                          'Rayavaram',
                          'Razole',
                          'Rowthulapudi',
                          'sakhinetipalle',
                          'Samalkota',
                          'Sankhavaram',
                          'Seethanagaram',
                          'Thallarevu',
                          'Thondangi',
                          'Tuni',
                          'Uppalaguptam',
                          'Y.Ramavaram',
                          'Yelesvaram',
                          'Achanta',
                          ' Akividu',
                          'Attili ',
                          'Bhimadole',
                          'Bhimavaram',
                          'Buttayagudem',
                          'Chagallu',
                          'Chintalapudi',
                          'Denduluru',
                          'Devarapalle',
                          'Dwaraka Tirumala',
                          'Eluru',
                          'Ganapavaram',
                          'Gopalapuram',
                          'Iragavaram',
                          'Jangareddygudem',
                          'Jeelugu',
                          'Kalla',
                          'Kamavarapukota',
                          'Kovvur',
                          'Koyyalagudem',
                          'Lingapalem',
                          'Mogalthur',
                          'Nallajerla',
                          'Narasapuram',
                          'Nidadavole',
                          'Palacoderu',
                          'Palakollu',
                          'Pedapadu',
                          'Pedavegi',
                          'Pentapadu',
                          'Penugonda',
                          'Penumantra',
                          'Poduru',
                          'Peravali',
                          'Poduru',
                          'Polavaram',
                          'T.Narasapuram',
                          'Tadepalligudem',
                          'Tallapudi',
                          'Tanuku',
                          'undi',
                          'Undrajavaram',
                          'Unguntur',
                          'Veeravasaram',
                          'Yelamanchili'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ))),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 90),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.redAccent,
                ),
                child: MaterialButton(
                  color: Colors.redAccent,
                  onPressed: () {

                    global.dmandal = umandal;
                    global.ddistrict = uDistrict;
                    global.dbgroup = bgroup;
                    // FlutterFirestore().addonnarSearch(
                    //     global.udistrict,
                    //     global.umandal,
                    //     global.ubgroup,
                    //    );
                       // search for donor and
                       Navigator.of(context).pushNamed(AppRoutes.dresult);
                    //saving user search to display on dash board
                    // search result page
                  },
                  child: Text(
                    "Find Donors",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}

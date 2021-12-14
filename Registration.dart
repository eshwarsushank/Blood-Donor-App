import 'package:donorfinal/services/firebase.dart';
import 'package:donorfinal/services/firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../global.dart' as global;

import '../routes.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _repasswordController = TextEditingController();
  final name = TextEditingController();

  final mobile = TextEditingController();
  String gender = 'Gender';
  String group = 'Blood Group';
  var district = 'District';
  String mandal = 'Mandal';

  void validateAndSave() {
    final FormState form = _formKey.currentState;
    if (form.validate()) {
      print('Form is valid');
      context.read<FlutterFireAuthService>().signUp(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
      );
    } else {
      print('Form is invalid');
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _repasswordController.dispose();
    mobile.dispose();
    name.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //logo,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      autofocus: true,
                      controller: name,
                      decoration: InputDecoration(
                        labelText: "FullName",
                      ),
                      keyboardType: TextInputType.text,
                      validator: (val) {
                        if (val.isEmpty) {
                          return 'Please Enter your fullname';
                        }
                        // global.username=name.;

                        return null;
                      },
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      autofocus: true,
                      controller: _emailController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Email",
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please  Enter EmailID';
                        }
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return 'Please a valid Email';
                        }

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      autofocus: true,
                      controller: mobile,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "phone number",
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter phone no ';
                        }
                        global.mobile = value;
                        return null;
                      },
                    ),
                  ), //phno code

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please  Enter Password';
                        }
                        return null;
                      },
                    ),
                  ),

                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(30),
                          child: Center(
                              child: DropdownButton<String>(
                            value: gender,
                            icon:
                                const Icon(Icons.arrow_drop_down_circle_rounded),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.redAccent),
                            underline: Container(
                              height: 2,
                              color: Colors.redAccent,
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                gender = newValue;
                                global.gender = gender;
                              });
                            },
                            items: <String>['Gender', 'Male', 'Female', 'Others']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ))),
                      Padding(
                          padding: const EdgeInsets.all(30),
                          child: Center(
                              child: DropdownButton<String>(
                                  value: group,
                                  icon: const Icon(
                                      Icons.arrow_drop_down_circle_sharp),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.redAccent),
                                  underline: Container(
                                      height: 2, color: Colors.redAccent),
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
                                  onChanged: (String newValue) {
                                    setState(() {
                                      group = newValue;
                                      global.bloodgroup = group;
                                    });
                                  }))),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(15),
                          child: Center(
                              child: DropdownButton<String>(
                                  value: district,
                                  icon: const Icon(
                                      Icons.arrow_drop_down_circle_rounded),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.redAccent),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.redAccent,
                                  ),
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
                                  onChanged: (String newValue) {
                                    setState(() {
                                      district = newValue;
                                      global.district = district;
                                    });
                                  }))),
                      Padding(
                          padding: const EdgeInsets.all(15),
                          child: Center(
                              child: DropdownButton<String>(
                            value: mandal,
                            icon: const Icon(Icons.arrow_drop_down_circle_sharp),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.redAccent),
                            underline:
                                Container(height: 2, color: Colors.redAccent),
                            /*onChanged: (String newValue) {
                              setState(() {
                                mandal = newValue;
                              });
                            },*/
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
                              'Yelamanchili',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(() {
                                mandal = newValue;
                                global.mandal = mandal;
                              });
                            },
                          ))),
                    ],
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height / 50),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.redAccent,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        // var a = context.read<FlutterFireAuthService>().verify();
                        // for (int i = 0; i<=10; i++) {
                        //   print(a.toString());
                        // }
                        global.mobile = mobile.text.trim();
                        global.username = name.text.trim();
                        //FlutterFirestore().rename();
                        validateAndSave();




                        // context.read<FlutterFireAuthService>().signUp(
                        //       email: _emailController.text.trim(),
                        //       password: _passwordController.text.trim(),
                        //       context: context,
                        //     );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.0),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "Already  a member ?",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                ?.copyWith(color: Colors.redAccent),
                          ),
                        ),
                        MaterialButton(
                          child: Text(
                            "LogIn?",
                            style:
                                Theme.of(context).textTheme.subtitle1?.copyWith(
                                      color: Colors.redAccent,
                                      decoration: TextDecoration.underline,
                                    ),
                          ),
                          onPressed: () {

                            // global.email=_emailController.text;
                            Navigator.of(context).pushNamed(AppRoutes.authLogin);
                          },
                        )
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

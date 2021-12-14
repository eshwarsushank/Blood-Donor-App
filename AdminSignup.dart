import 'package:donorfinal/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
//import '../global.dart' as global;

import '../routes.dart';

class AdRegisterView extends StatefulWidget {
  const AdRegisterView({Key key}) : super(key: key);

  @override
  _AdRegisterViewState createState() => _AdRegisterViewState();
}

class _AdRegisterViewState extends State<AdRegisterView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _repasswordController = TextEditingController();
  final name = TextEditingController();

  final mobile = TextEditingController();
  

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
     final mq = MediaQuery.of(context);
     final logo = Image.asset(
      "assets/images/icon.png",
      height: mq.size.height / 3.5,
    );
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo,
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
                      return 'Please a Enter';
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
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please a Enter Password';
                    }
                    return null;
                  },
                ),
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
                    // global.aemail =_emailController.text.trim();
                    // global.amobile = mobile.text.trim();
                    // global.ausername = name.text.trim();
                    context.read<FlutterFireAuthService>().signUp(
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                          context: context,
                        );
                   
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
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
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
    );
  }
}

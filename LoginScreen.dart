import 'package:donorfinal/Screens/donohome.dart';
import 'package:donorfinal/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './forgotpass.dart';

import '../routes.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextFormField(
                  autofocus: true,
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.0),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                MaterialButton(
                  child: Text(
                    "Forget Password ?",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: Colors.redAccent),
                  ),
                  onPressed: () {
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgotPassword()),);
                  },
                )
              ]),
              SizedBox(height: MediaQuery.of(context).size.height / 50),
              Container(
                width: MediaQuery.of(context).size.width / 1.4,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue,
                ),
                child: MaterialButton(
                  color: Colors.redAccent,
                  onPressed: () {
                    context.read<FlutterFireAuthService>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          context: context,
                        );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => DonoHome(),
                    //   ),
                    // );
                  },
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(2.5),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Not a member ?",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: Colors.redAccent),
                  ),
                ),
                MaterialButton(
                  child: Text(
                    "SignUp?",
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          color: Colors.redAccent,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.authRegister);
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

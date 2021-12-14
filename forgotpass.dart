import 'package:donorfinal/Screens/OpenView.dart';
import 'package:donorfinal/services/firebase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword
({ Key key }) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  
  @override
  void dispose() {
    emailController.dispose();
    
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final logo = Image.asset(
      "assets/images/icon.png",
      height: mq.size.height / 3.5,
    );
    return  Scaffold(
          body: Container(
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
                  padding: EdgeInsets.all(2.0),
                ),
                
                
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
                      String email = emailController.text.toString();
                      context.read<FlutterFireAuthService>().resetPassword(
                            email: email,
                           
                          );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OpenView(),
                        ),
                      );
                    },
                    child: Text(
                      "ResetPassword",
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
              ],
            ),
          ),
    );
  }
}
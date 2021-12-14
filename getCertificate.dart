import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Certificate extends StatefulWidget {
  const Certificate({Key key}) : super(key: key);

  @override
  _CertificateState createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {
  InAppWebViewController controller;
  String url = "https://docs.google.com/forms/d/e/1FAIpQLSdSvlvEhmV0YBXJdrRRcC5Vr95Dvgr4BWwrBVE4KuIUFG40iQ/viewform?usp=sf_link";
  double progress = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Blood Donor Hub"),
      ),
      body: SafeArea(
        child: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container(),
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.all(10.0),
              decoration:
                  BoxDecoration(
                    border: Border.all(
                      color: Colors.redAccent)
                      ),
                      child:InAppWebView(
                        initialUrl: url,
                        initialHeaders:{},
                        initialOptions: InAppWebViewGroupOptions(
                          crossPlatform:InAppWebViewOptions(debuggingEnabled:true)),
                          onWebViewCreated: (webViewController)=>controller=webViewController,
                          onLoadStart: (controller,url){
                            setState(() {
                              this.url=url;
                            });
                          },
                          onLoadStop: (controller,url){
                            setState(() {
                              this.url= url;
                            });
                          },
                          onProgressChanged: (controller,progress){
                            setState(() {
                              this.progress=progress/100;
                            });
                          },
                        ),
                        
            ))
          ],
        )),
      ),
    );
  }
}

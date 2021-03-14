import 'package:flutter/material.dart';
import 'package:tugas_akhir/services/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                  child: Text("Sign Up"),
                  onPressed: () async {
                    SignInSignUpResult result = await AuthServices.signUP(
                        "petani@buahnaga.com", "123456", "petani");

                    if (result.user == null) {
                      print(result.messege);
                    } else {
                      print(result.user.toString());
                    }
                  }),
              RaisedButton(
                  child: Text("Sign In"),
                  onPressed: () async {
                    SignInSignUpResult result = await AuthServices.signIn(
                        "petani@buahnaga.com", "1234567");

                    if (result.user == null) {
                      print(result.messege);
                    } else {
                      print(result.user.toString());
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

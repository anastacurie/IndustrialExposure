import 'package:flutter/material.dart';

class TryLogin extends StatefulWidget {
  const TryLogin({Key? key}) : super(key: key);

  @override
  _TryLoginState createState() => _TryLoginState();
}

class _TryLoginState extends State<TryLogin> {
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: email,
          ),
          TextField(),
          ElevatedButton(
            onPressed: () {
              var email1 = email.text;
              print("Email is $email1");
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}

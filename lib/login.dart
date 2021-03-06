import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:industrial_exposure/dashboard.dart';
import 'package:http/http.dart' as http;
import './register.dart';

class LoginRoute extends StatefulWidget {
  const LoginRoute({Key? key}) : super(key: key);
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  TextEditingController emailTE = TextEditingController();
  TextEditingController passTE = TextEditingController();
  Future userLogin() async {
    final prefs=await SharedPreferences.getInstance();
    String email = emailTE.text;
    String password = passTE.text;
    var url = "http://192.168.240.84/ie_api/login_register/login.php";
    var data = {"email": email, "password": password};
    var response = await http.post(Uri.parse(url), body: json.encode(data));
    var login_message = json.decode(response.body);
    //print(login_message);
    //print(login_message["phone"].toString());
    if (login_message["error"] == false) {
      prefs.setString("email", login_message["email"]);
      prefs.setString("phone", login_message["phone"]);
      //print(prefs.getString("email"));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboadRoute(),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterRoute(),
        ),
      );
    }
    //print("Hello");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.3,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.deepOrange,
                  Colors.orangeAccent,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: size.height * 0.1,
                ),
                Container(
                  height: size.height * 0.1,
                  child: const Center(
                    child: Icon(
                      Icons.info_sharp,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.1,
                  width: size.width,
                  margin: const EdgeInsets.only(right: 20),
                  child: const Text(
                    "Login",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(25),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 5,
                          spreadRadius: -3,
                          color: Colors.black),
                    ],
                  ),
                  margin: const EdgeInsets.only(top: 10, bottom: 15),
                  child: TextField(
                    controller: emailTE,
                    decoration: const InputDecoration(
                      isDense: true, // used to size(height) textField
                      contentPadding:
                          EdgeInsets.all(11), // used to size(height) textField
                      enabledBorder: InputBorder.none,
                      icon: Icon(
                        Icons.mail,
                      ),
                      hintText: "Email",
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 5,
                          spreadRadius: -3),
                    ],
                  ),
                  child: TextField(
                    controller: passTE,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(11),
                      enabledBorder: InputBorder.none,
                      icon: Icon(Icons.password_sharp),
                      hintText: "Password",
                    ),
                    autocorrect: false,
                    enableSuggestions: false,
                    obscureText: true,
                  ),
                ),
                Container(
                  width: size.width,
                  child: const Text(
                    "Forgot Password?",
                    textAlign: TextAlign.right,
                  ),
                ),
                InkWell(
                  onTap: () {
                    userLogin();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 100,
                    ),
                    width: size.width,
                    height: 40,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.orange,
                          Colors.deepOrange,
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "LOGIN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                // Text("data"),
                Center(
                  //child: Text("data"),
                  child: RichText(
                    text: const TextSpan(
                      text: "Don't have account? ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: "Register",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            width: size.width,
          ),
        ],
      ),
    );
  }
}

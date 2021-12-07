import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:industrial_exposure/login.dart';

class RegisterRoute extends StatefulWidget {
  const RegisterRoute({Key? key}) : super(key: key);

  @override
  _RegisterRouteState createState() => _RegisterRouteState();
}

class _RegisterRouteState extends State<RegisterRoute> {
  TextEditingController nameTE = TextEditingController();
  TextEditingController emailTE = TextEditingController();
  TextEditingController phoneTE = TextEditingController();
  TextEditingController passTE = TextEditingController();
  String url = "http://192.168.240.84/ie_api/login_register/register.php";
  Future registerUser() async {
    String name = nameTE.text;
    String phone = phoneTE.text;
    String email = emailTE.text;
    String password = passTE.text;
    var data = {
      "name": name,
      "phone": phone,
      "email": email,
      "password": password
    };
    var res=await http.post(Uri.parse(url),body: jsonEncode(data));
    print(res.body);
    var data_json=jsonDecode(res.body);
    //var response
    if(data_json['error']==false)
      {
        //print("Login");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginRoute(),),);
      }
    else
      {
        print("Register");
      }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.orange,
                    Colors.deepOrange,
                  ],
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
                        Icons.access_alarm_rounded,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20, top: 10),
                    width: size.width,
                    child: const Text(
                      "Register",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              width: size.width,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 5,
                            spreadRadius: -5,
                          ),
                        ]),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextField(
                      controller: nameTE,
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        icon: Icon(Icons.person),
                        hintText: "Fullname",
                        isDense: true,
                        contentPadding: EdgeInsets.all(8),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 5,
                            spreadRadius: -5,
                          ),
                        ]),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextField(
                      controller: emailTE,
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        icon: Icon(Icons.mail),
                        hintText: "Email",
                        isDense: true,
                        contentPadding: EdgeInsets.all(8),
                      ),
                      //controller: emailTE,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 5,
                            spreadRadius: -5,
                          ),
                        ]),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextField(
                      controller: phoneTE,
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        icon: Icon(Icons.phone),
                        hintText: "Phone Number",
                        isDense: true,
                        contentPadding: EdgeInsets.all(8),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 3),
                            blurRadius: 5,
                            spreadRadius: -5,
                          ),
                        ]),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: TextField(
                      controller: passTE,
                      decoration: const InputDecoration(
                        enabledBorder: InputBorder.none,
                        icon: Icon(Icons.password_rounded),
                        hintText: "Password",
                        isDense: true,
                        contentPadding: EdgeInsets.all(8),
                      ),
                      obscureText: true,
                      autocorrect: false,
                      enableSuggestions: false,
                    ),
                  ),
                  InkWell(
                    onTap: (){registerUser();},
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 60,
                      ),
                      width: size.width,
                      height: 30,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.orange,
                            Colors.deepOrange,
                          ],
                        ),
                      ),

                      child: const Center(
                        child: Text(
                          "REGISTER",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                          text: "Already a member? ",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "Login",
                              style: TextStyle(color: Colors.red),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

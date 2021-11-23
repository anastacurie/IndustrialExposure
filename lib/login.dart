import 'package:flutter/material.dart';

class LoginRoute extends StatelessWidget {
  const LoginRoute({Key? key}) : super(key: key);

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
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import './constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
String new_email='';
class DashboadRoute extends StatefulWidget {
  const DashboadRoute({Key? key}) : super(key: key);
  @override
  _DashboardRouteState createState() => _DashboardRouteState();
}
class _DashboardRouteState extends State<DashboadRoute> {
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }
  String new_email="";
  String new_phone="";
  Future getData() async{
    SharedPreferences preff=await SharedPreferences.getInstance();
    String email=preff.getString("email").toString();
    String phone=preff.getString("phone").toString();
    setState(() {
      new_email=email;
      new_phone=phone;
    });
    //print(new_email);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: aGreen,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(),
              width: size.width,
              height: size.height * 0.5,
              child: const Center(
                child: Text(
                  "Qonics Inc",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: size.width,
              child: Column(
                children: [
                   Text(
                    "SHEMA Ally Blaise: ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "FLUTTER DEVELOPER",
                      style: TextStyle(
                        color: Colors.white60,
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white38,
                    indent: 115,
                    endIndent: 115,
                    thickness: 1,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: aGreen,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            new_phone,
                            style: TextStyle(fontSize: 18, color: aGreen),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.mail,
                          color: aGreen,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            new_email,
                            style: TextStyle(fontSize: 18, color: aGreen),
                          ),
                        )
                      ],
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

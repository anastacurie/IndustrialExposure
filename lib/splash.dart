import 'package:flutter/material.dart';
import 'package:industrial_exposure/login.dart';

class SplashRoute extends StatefulWidget {
  const SplashRoute({Key? key}) : super(key: key);

  @override
  _SplashRouteState createState() => _SplashRouteState();
}

class _SplashRouteState extends State<SplashRoute> {
  @override
  void initState() {
    super.initState();
    _movetonext();
  }

  _movetonext() async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginRoute(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.orange, Colors.deepOrange],
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.access_time,
            size: 100,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

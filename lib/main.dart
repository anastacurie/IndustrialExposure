import 'package:flutter/material.dart';
import './dashboard.dart';
import './login.dart';
import './splash.dart';
import './register.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashRoute(),
      ),
    );

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kartproject/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Splash2())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Image.asset(
              "assets/images/logo.png",
              height: 104,
              width: 104,
              fit: BoxFit.fill,
            ),
            ),
        );
    }
}
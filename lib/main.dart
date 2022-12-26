import 'dart:async';

import 'package:a_car_rental/AdminLoginScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AdminLoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/image/clip.png',
                    fit: BoxFit.cover,
                  )),
              Image.asset('assets/image/car_picture.jpg'),
              Text(
                'WELCOME',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
              Container(
                width: 190,
                height: 100,
                margin: EdgeInsets.fromLTRB(150, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade900,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text(
                  'CAR \n RENTAL',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                )),
              ),
              ElevatedButton(
                child: Text('Proceed'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

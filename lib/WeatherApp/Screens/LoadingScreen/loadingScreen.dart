

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/WeatherApp/Screens/HomePage/HomePage.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    ),
  );
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/img/lo.png',
                  fit: BoxFit.cover,
                )),
            const Text(
              'Weather App',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Made By Atul',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const SpinKitFadingFour(
              color: Colors.deepPurple,
              size: 50.0,
            )
          ],
        ),
      ),
    );
  }

  Future<Timer> loadData() async {
    return Timer(const Duration(seconds: 5), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }
}

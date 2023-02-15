import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather/WeatherApp/Screens/HomePage/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      theme: ThemeData.light(),
      home: const HomePage(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:weather_app/view/daily_details_page.dart';
import 'package:weather_app/view/home_page.dart';
import 'package:weather_app/view/tabs_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TabsPage(),
    );
  }
}



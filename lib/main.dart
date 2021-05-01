import 'package:flutter/material.dart';
import 'package:flutter_cars_app_ex/screens/add_new_car_screen.dart';
import 'package:flutter_cars_app_ex/screens/edit_car_screen.dart';
import 'package:flutter_cars_app_ex/screens/car_details_screen.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cars App',
      home: HomeScreen(),
      routes: {
        CarDetailsScreen.routeName: (ctx) => CarDetailsScreen(),
        AddNewCarScreen.routeName: (ctx) => AddNewCarScreen(),
        EditCarScreen.routeName: (ctx) => EditCarScreen(),
      },
    );
  }
}


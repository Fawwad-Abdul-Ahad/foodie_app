import 'package:flutter/material.dart';
import 'package:foodie/viewmodel/restaurant/restaurant_view.dart';
import 'package:foodie/viewmodel/tabbar/tabbar.dart';
import 'package:foodie/viewmodel/home1/homscreen_view.dart';
import 'package:foodie/viewmodel/signin/signin_view.dart';
import 'package:foodie/viewmodel/signup/signup_view.dart';

import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodie/viewmodel/home/homscreen_view.dart';
import 'package:foodie/viewmodel/home/login/login_view.dart';
import 'package:foodie/viewmodel/home/signup/signup_view.dart';
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

      // Define routes here
      initialRoute: '/', // Set initial route to login screen
      getPages: [
        GetPage(name: '/', page: () => LoginView()),   // LoginView route
        GetPage(name: '/signup', page: () => SignupView()),  // SignupView route
        GetPage(name: '/home', page: () => HomeScreen()), // HomeScreen route
      ],
      home: LoginView(),
    );
  }
}

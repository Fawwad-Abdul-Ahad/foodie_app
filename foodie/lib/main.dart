import 'package:flutter/material.dart';
import 'package:foodie/viewmodel/home/homscreen_view.dart';
import 'package:foodie/viewmodel/home/login/login_view.dart';
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
      onGenerateRoute: (settings){
        if(settings.name == '/' ){
          return MaterialPageRoute(builder: (context)=> LoginView());
        }
        if(settings.name == '/home' ){
          final String arguments = settings.arguments as String;
          return MaterialPageRoute(builder: (context)=> HomeScreen());
        }
      },

      home: LoginView(),
    );
  }
}
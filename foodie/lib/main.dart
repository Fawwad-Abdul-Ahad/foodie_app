import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodie/firebase_options.dart';
import 'package:foodie/viewmodel/restaurant/restaurant_view.dart';
import 'package:foodie/viewmodel/tabbar/tabbar.dart';
import 'package:foodie/viewmodel/home1/homscreen_view.dart';
import 'package:foodie/viewmodel/signin/signin_view.dart';
import 'package:foodie/viewmodel/signup/signup_view.dart';


import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginView(),
    );
  }
}

import 'package:flutter/material.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            // padding: EdgeInsets.all(1),
            width: screenWidth * 1,
            height: screenHeight * 1,
            child: Image.asset(
              'assets/images/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(child: Container(
            width: screenWidth*1,
            height: screenHeight*0.2,
          ))
        ],
      ),
    );
  }
}
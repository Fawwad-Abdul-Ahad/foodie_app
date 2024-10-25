import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/components/text_component.dart';

class CategoryWidget extends StatelessWidget {
   CategoryWidget({super.key,required this.image,required this.name});
  String image;
  String name;

  @override
  Widget build(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
    return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: screenWidth*0.2,
                          height: screenHeight*0.1,
                          decoration: BoxDecoration(
                          color: const Color.fromARGB(225, 9, 7, 31),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color.fromARGB(255, 11, 3, 48),
                            ),
                          
                          ),
                          child: Center(
                            child: Image.asset(image),
                          ),
                          
                        ),
                      ),
                      TextWidget(text: name, fontSize: 16, fontweight: FontWeight.w600, textColor: Colors.white)
                    ],
                  );
  }
}
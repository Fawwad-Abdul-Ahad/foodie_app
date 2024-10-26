import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodie/components/text_component.dart';
import 'package:get/get.dart';

class ProductOrderWidget extends StatelessWidget {
  const ProductOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Material(
      elevation: 12,
      color: const Color.fromARGB(195, 13, 10, 46),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.25,
        decoration: BoxDecoration(
            color: const Color.fromARGB(195, 13, 10, 46),
            borderRadius: BorderRadius.circular(12)),
        child: Stack(
          children: [
            Positioned(
                left: 0,
                child: Container(
                  padding: EdgeInsets.all(15),
                  width: screenWidth * 0.6,
                  height: screenHeight * 1,
                  // color: Colors.red,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                          text: "30% OFF",
                          fontSize: 32,
                          fontweight: FontWeight.bold,
                          textColor: Colors.white),
                      TextWidget(
                          text:
                              "Discover discounts in your favourite local restaurant",
                          fontSize: 15,
                          fontweight: FontWeight.w400,
                          textColor: Colors.white),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(0, 0, 0, 0.414),
                              Color.fromRGBO(64, 39, 136, 1)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(
                              12), // Optional for rounded corners
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {
                            Get.toNamed('/restaurant');
                          },
                          child: TextWidget(
                              text: "Order Now",
                              fontSize: 16,
                              fontweight: FontWeight.w400,
                              textColor: Colors.white),
                        ),
                      )
                    ],
                  ),
                )),
            Positioned(
                right: 0,
                bottom: 30,
                child: Image.asset("assets/images/Pasta.png"))
          ],
        ),
      ),
    );
  }
}

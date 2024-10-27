import 'package:flutter/material.dart';
import 'package:foodie/components/text_component.dart';
import 'package:foodie/viewmodel/home1/productModel.dart';
import 'package:foodie/viewmodel/menu_screen/menuscreen_view.dart.dart';
import 'package:foodie/viewmodel/restaurant/restaurant_viewmodel.dart';
import 'package:get/get.dart';

class RestaurantView extends StatelessWidget {
  RestaurantView(
      {super.key, required this.ProductData, required this.CategoryDataMap});
  productModel ProductData;
  Map CategoryDataMap;
  final controller = Get.put(RestaurantViewModel());
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
            Positioned(
                child: Stack(
              children: [
                Container(
                  width: screenWidth * 1,
                  height: screenHeight * 0.4,
                  // color: Colors.green,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        '${CategoryDataMap['image']}',
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                    top: 0,
                    child: SafeArea(
                      child: Container(
                        // color: const Color.fromARGB(72, 166, 175, 255),
                        height: screenHeight * 0.08,
                        width: screenWidth * 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 12),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 31, 7, 71),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 97, 163, 255))),
                                  height: screenHeight * 0.06,
                                  width: screenWidth * 0.12,
                                  child: Center(
                                      child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 28,
                                  )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
              ],
            )),
            
            Positioned(
                top: 350,
                left: 20,
                right: 20,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.95,
                    decoration: BoxDecoration(
                    color: const Color.fromARGB(72, 10, 5, 57),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color.fromARGB(255, 101, 181, 246)
                    )
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: screenWidth*1,
                          height: screenHeight*0.08,
                          // color: Colors.green,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(text: CategoryDataMap['restaurantName'], fontSize: 26, fontweight: FontWeight.bold, textColor: Colors.white),
                              TextWidget(text: CategoryDataMap['restaurantAddress'], fontSize: 16, fontweight:FontWeight.w400, textColor: Colors.grey),
                            ],
                          ),
                          ),
                          SizedBox(height: screenHeight*0.02,),
                          Container(
                            width: screenWidth*1,
                            height: screenHeight*0.06,
                            // color: Colors.green,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: screenWidth*0.25,
                                  height: screenHeight*1,
                                  // color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(text:'Delivery Fee', fontSize: 15, fontweight: FontWeight.w500, textColor: const Color.fromARGB(255, 187, 187, 187)),
                                      TextWidget(text: "\$${CategoryDataMap['deliveryFee']}", fontSize: 18, fontweight: FontWeight.w700, textColor: const Color.fromARGB(255, 255, 255, 255))
                                    ],
                                  ),
                                ),
                                Container(
                                  width: screenWidth*0.25,
                                  height: screenHeight*1,
                                  // color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(text:'Service Fee', fontSize: 15, fontweight: FontWeight.w500, textColor: const Color.fromARGB(255, 187, 187, 187)),
                                      TextWidget(text: "\$${CategoryDataMap['serviceFee']}", fontSize: 18, fontweight: FontWeight.w700, textColor: const Color.fromARGB(255, 255, 255, 255))
                                    ],
                                  ),
                                ),
                               Container(
                                  width: screenWidth*0.25,
                                  height: screenHeight*1,
                                  // color: Colors.red,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(text:'Total Fee', fontSize: 15, fontweight: FontWeight.w500, textColor: const Color.fromARGB(255, 187, 187, 187)),
                                      TextWidget(text: "\$${CategoryDataMap['deliveryFee']??'0'+CategoryDataMap['serviceFee']??'0'}", fontSize: 18, fontweight: FontWeight.w700, textColor: const Color.fromARGB(255, 255, 255, 255))
                                    ],
                                  ),
                                ),
                                
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                )),
                
          ],
        ),
      ),
    );
  }
}

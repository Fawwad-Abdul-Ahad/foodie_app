import 'package:flutter/material.dart';
import 'package:foodie/components/text_component.dart';
import 'package:foodie/viewmodel/home1/homescreen_viewmodel.dart';
import 'package:foodie/viewmodel/menu_screen/menuscreen_view.dart.dart';
import 'package:foodie/viewmodel/home1/productModel.dart';
import 'package:foodie/viewmodel/home1/categories_list.dart';
import 'package:foodie/viewmodel/home1/widget/category_widget.dart';
import 'package:foodie/viewmodel/home1/widget/product_order.dart';
import 'package:foodie/viewmodel/restaurant/restaurant_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    HomeScreenViewController controller = HomeScreenViewController();

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
          SafeArea(
              child: Positioned(
                  child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  width: screenWidth * 1,
                  height: screenHeight * 0.1,
                  // color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.menu,
                        size: 28,
                        color: Colors.white,
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                              text: "Delivery",
                              fontSize: 18,
                              fontweight: FontWeight.w400,
                              textColor:
                                  const Color.fromARGB(255, 144, 144, 144)),
                          TextWidget(
                              text: 'Maplewood Suites',
                              fontSize: 22,
                              fontweight: FontWeight.w500,
                              textColor: Colors.white),
                        ],
                      ),
                      SizedBox(
                        width: screenWidth * 0.05,
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 133, 131, 131))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.changeColorCycle();
                              },
                              child: Obx(
                                () => Material(
                                  elevation: 4,
                                  borderRadius: BorderRadius.circular(14),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: controller.isCycle.value
                                            ? Color.fromRGBO(42, 92, 228, 0.698)
                                            : Color.fromRGBO(15, 37, 96, 0.694),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    width: screenWidth * 0.11,
                                    height: screenHeight * 0.09,
                                    child: Center(
                                      child: Image.asset(
                                        'assets/images/cycle_icon.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                controller.changeColorCycle();
                              },
                              child: Obx(
                                () => Material(
                                  elevation: 4,
                                  borderRadius: BorderRadius.circular(14),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: controller.isCycle.value
                                            ? Color.fromRGBO(15, 37, 96, 0.694)
                                            : Color.fromRGBO(
                                                42, 92, 228, 0.698),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    width: screenWidth * 0.11,
                                    height: screenHeight * 1,
                                    child: Image.asset(
                                        'assets/images/walk_icon.png'),
                                    // color: const Color.fromARGB(255, 33, 26, 25),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 2),
                  width: screenWidth * 1,
                  height: screenHeight * 0.07,
                  // color: Colors.red,
                  child: Material(
                    elevation: 2,
                    color: const Color.fromARGB(0, 0, 0, 0),
                    child: TextFormField(
                      style: GoogleFonts.openSans(
                          fontSize: 18, color: Colors.white),
                      enabled: true,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.white)),
                          hintText: 'Your Order?',
                          hintStyle: GoogleFonts.openSans(
                              fontSize: 18,
                              color: const Color.fromARGB(255, 166, 166, 166)),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 24,
                            color: Colors.white,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  height: screenHeight * 0.05,
                  width: screenWidth * 1,
                  // color: const Color.fromARGB(255, 16, 16, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                          text: "Categories",
                          fontSize: 18,
                          fontweight: FontWeight.w600,
                          textColor: Colors.white),
                      TextWidget(
                          text: "see all",
                          fontSize: 14,
                          fontweight: FontWeight.w400,
                          textColor: const Color.fromARGB(255, 205, 205, 205)),
                    ],
                  ),
                ),
                
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final data = categories[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(RestaurantView(
                              categoryData: controller.products[index],
                              productModelData: data,
                            ));
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left:14),
                              child: Column(
                                children: [
                                  Container(
                                    height: 90,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(255, 165, 136, 244)),
                                      color: const Color.fromARGB(255, 31, 7, 71),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset('${data['icon']}'),
                                  ),
                                  const SizedBox(height: 8),
                                  TextWidget(
                                      text: data['name'],
                                      fontSize: 18,
                                      fontweight: FontWeight.bold,
                                      textColor: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),

                FutureBuilder(
                  future: controller.FetchProducts(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      return Obx(() {
                        if (controller.products.isEmpty) {
                          return const Center(
                            child: Text('No products found.'),
                          );
                        } else {
                          return GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.73,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            itemCount: controller.products.fold<int>(
                              0,
                              (sum, product) =>
                                  sum + (product.items?.length ?? 0),
                            ),
                            itemBuilder: (context, index) {
                              int currentIndex = 0;
                              Items? currentItem;

                              // Find the correct item by index
                              for (var product in controller.products) {
                                if (currentIndex +
                                        (product.items?.length ?? 0) >
                                    index) {
                                  currentItem =
                                      product.items![index - currentIndex];
                                  break;
                                }
                                currentIndex += product.items?.length ?? 0;
                              }

                              return currentItem != null
                                  ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(() => MenuScreenView(
                                                image: currentItem!.image ?? '',
                                                name: currentItem.name ?? '',
                                                desc: currentItem.description ?? '',
                                                price: currentItem.price ?? 0,
                                              ));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.deepPurpleAccent),
                                            color: const Color.fromARGB(
                                                255, 31, 7, 71),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: Image.network(
                                                  currentItem.image ?? '',
                                                  height: 130,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return const Center(
                                                      child: Icon(Icons.error,
                                                          color: Colors.red),
                                                    );
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextWidget(
                                                      text: currentItem.name ??
                                                          'Unknown',
                                                      textColor: Colors.white,
                                                      fontweight:
                                                          FontWeight.bold,
                                                      fontSize: 17,
                                                    ),
                                                    TextWidget(
                                                      text:
                                                          'Rs: ${currentItem.price?.toInt() ?? '0'}',
                                                      textColor: Colors.white54,
                                                      fontSize: 14,
                                                      fontweight:
                                                          FontWeight.w300,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox.shrink();
                            },
                          );
                        }
                      });
                    }
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                
              ],
            ),
          )))
        ],
      ),
    );
  }
}

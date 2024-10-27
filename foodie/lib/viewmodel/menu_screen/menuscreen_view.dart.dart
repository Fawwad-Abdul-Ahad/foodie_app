import 'package:flutter/material.dart';

import 'package:foodie/components/text_component.dart';
import 'package:foodie/viewmodel/menu_screen/addtocart_items.dart';
import 'package:foodie/viewmodel/menu_screen/menuscreen_viewmodel.dart';
import 'package:foodie/viewmodel/orderscreen/orderscreen_view.dart';
import 'package:foodie/viewmodel/orderscreen/orderscreen_viewmodel.dart';
import 'package:get/get.dart';

class MenuScreenView extends StatelessWidget {
  final String image;
  final String name;
  final String desc;
  final int price;
  MenuScreenView(
      {super.key,
      required this.image,
      required this.name,
      required this.desc,
      required this.price});

  final controller = Get.put(MenuScreenViewModel());
  final cartController = Get.put(CartController (),permanent: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: InkWell(
          onTap: () {
            Get.back();
            controller.quantity.value = 1;
          },
          child: Container(
            height: 50,
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white10),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey[800]!),
                borderRadius: BorderRadius.circular(5),
              ),
              child:Icon(Icons.favorite),
            ),
          ),
          
          const SizedBox(width: 20),
        ],
      ),
      body: Container(
        // Make the container fill the entire screen
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Color(0xff151232), Color(0xff392776)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                color: Colors.black,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[700]!),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: name,
                        textColor: Colors.white,
                        fontSize: 20,
                        fontweight: FontWeight.bold,
                      ),
                      SizedBox(height: 5),
                      TextWidget(
                        text: 'Rs $price',
                        textColor: Colors.white,
                        fontSize: 18,
                        fontweight: FontWeight.bold,
                      ),
                      SizedBox(height: 10),
                      TextWidget(text: desc, textColor: Colors.grey,fontSize: 12,fontweight: FontWeight.w400,),
                      const SizedBox(height: 20),
                      Container(
                        width: 110,
                        height: 40,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 12, 12, 12),
                            border: Border.all(color: Colors.grey[800]!),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  controller.addQuantity();
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15,
                                )),
                            Obx(() => TextWidget(
                                text: controller.quantity.value.toString(),
                                textColor: Colors.white,
                                fontSize: 14,
                                fontweight: FontWeight.w400,
                                )),
                            const SizedBox(width: 3),
                            IconButton(
                                onPressed: () {
                                  controller.decreaseQuantity();
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 15,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        
        color: Colors.black,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 48, 33, 87)
                      ),
          onPressed: () {
            var item = CartItem(
              name: name,
              price: price,
              image: image,
              quantity: (controller.quantity.value),
            );
            cartController.addItem(item,
                initialQuantity: controller.quantity.value);
            controller.quantity.value = 1;
            Get.to(OrderDetailView());
          },
          child: Text("Add to Basket"),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:foodie/components/text_component.dart';
import 'package:foodie/viewmodel/orderscreen/orderscreen_viewmodel.dart';
import 'package:get/get.dart';

class OrderDetailView extends StatelessWidget {
  const OrderDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController(),permanent: true);

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(),
          gradient: LinearGradient(
            colors: [Color(0xff151232), Color(0xff392776), Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextWidget(
                  text: 'Order Detail',
                  fontweight: FontWeight.bold,
                  fontSize: 23,
                  textColor: Colors.white,
                ),
              ),
              Expanded(
                child: Obx(() {
                  if (cartController.cartItems.isEmpty) {
                    return Center(
                      child: TextWidget(
                        text: 'Your cart is empty!',
                        textColor: Colors.white,
                        fontSize: 38,
                        fontweight: FontWeight.w500,
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartController.cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(          
                              color: Colors.white,
                            )
                          ),
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    item.image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(() => TextWidget(
                                        text:
                                            "Rs ${item.price.value * item.quantity.value}",
                                        textColor: Colors.white,
                                        fontSize: 14,
                                        fontweight: FontWeight.w400,
                                      )),
                                  TextWidget(
                                    text: item.name,
                                    textColor: Colors.white,
                                    fontSize: 22,
                                    fontweight: FontWeight.w500,
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            cartController.addQuantity(item);
                                          },
                                          child: const Text('+',
                                              style: TextStyle(fontSize: 18)),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: Obx(() => Text(
                                                item.quantity.value.toString(),
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            cartController
                                                .decreaseQuantity(item);
                                          },
                                          child: const Text('-',
                                              style: TextStyle(fontSize: 22)),
                                        ),
                                      ],
                                    )
                                  ),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  cartController.removeItem(item);
                                },
                                child: Icon(Icons.delete, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: Get.width*0.8,
                    height: Get.height*0.06,
                    // padding: EdgeInsets.symmetric(horizontal: 12),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 48, 33, 87)
                      ),
                              onPressed: () {
                                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff1D102D),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min, // Adjusts height to fit content
                          children: [
                            paymentSummary(
                                cartController.totalPrice.toString(), "Subtotal"),
                            paymentSummary('Free', "Delivery"),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                TextWidget(
                                  fontSize: 16,
                                  text: 'Total',
                                  textColor: Colors.white,
                                  fontweight: FontWeight.w400,
                                ),
                                const Spacer(),
                                Obx(() => TextWidget(
                                      fontSize: 16,
                                      text: 'Rs ${cartController.totalPrice}',
                                      fontweight: FontWeight.bold,
                                      textColor: Colors.white,
                                    )),
                              ],
                            ),
                            const SizedBox(height: 25),
                            // Uncomment this section if you want to add a button
                            // Center(
                            //   child: ElevatedButton(
                            //     onPressed: () {
                            //       cartController.addItemsToDatabase();
                            //     },
                            //     style: ElevatedButton.styleFrom(
                            //       primary: Colors.green, // Button color
                            //       padding: const EdgeInsets.symmetric(
                            //           horizontal: 50, vertical: 15),
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(10),
                            //       ),
                            //     ),
                            //     child: const Text(
                            //       'Proceed to Checkout',
                            //       style: TextStyle(fontSize: 16, color: Colors.white),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      );
                    },
                                );
                              },
                              child: TextWidget(fontSize: 18,fontweight: FontWeight.w600,text: 'Show Order History', textColor: const Color.fromARGB(255, 255, 255, 255),),
                            ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentSummary(String charges, String chargesName) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(chargesName,
              style: const TextStyle(fontSize: 13, color: Colors.white54)),
          Text(charges,
              style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white54)),
        ],
      ),
    );
  }
}
 
import 'package:get/get.dart';

class CartItem {
  String name;
  String image;
  RxInt price; // Declare price as RxDouble
  RxInt quantity; // Declare quantity as RxInt

  CartItem({
    required this.name,
    required this.image,
    required int price, // Take price as a double
    int quantity = 1, // Default quantity to 1
  })  : this.price = price.obs, // Initialize price as an observable
        this.quantity = quantity.obs; // Initialize quantity as an observable
}
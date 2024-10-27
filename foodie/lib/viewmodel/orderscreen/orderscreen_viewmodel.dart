
import 'package:flutter/material.dart';
import 'package:foodie/viewmodel/menu_screen/addtocart_items.dart';
import 'package:get/get.dart';


class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  // Function to add item to the cart
  void addItem(CartItem item, {int initialQuantity = 1}) {
    var existingItem = cartItems.firstWhereOrNull(
      (i) => i.name == item.name && i.price == item.price,
    );

    if (existingItem != null) {
      // Increase quantity of the existing item
      existingItem.quantity.value += initialQuantity;
    } else {
      // Add new item with initial quantity
      item.quantity.value = initialQuantity;
      cartItems.add(item);
    }
    update(); // Notify UI of changes
  }

  // Function to increase quantity of a specific item
  void addQuantity(CartItem item) {
    var index = cartItems.indexWhere(
      (i) => i.name == item.name && i.price == item.price,
    );
    if (index != -1) {
      cartItems[index].quantity.value++;
      debugPrint("Added quantity: ${cartItems[index].quantity} for ${item.name}");
    }
  }

  // Function to decrease quantity of a specific item
  void decreaseQuantity(CartItem item) {
    var index = cartItems.indexWhere(
      (i) => i.name == item.name && i.price == item.price,
    );
    if (index != -1) {
      if (cartItems[index].quantity.value > 1) {
        cartItems[index].quantity.value--;
        debugPrint("Decreased quantity: ${cartItems[index].quantity} for ${item.name}");
      } else {
        // Remove item if quantity becomes 0
        removeItem(item);
      }
    }
  }

  // Function to remove item from the cart
  void removeItem(CartItem item) {
    cartItems.removeWhere((i) => i.name == item.name && i.price == item.price);
    debugPrint("Removed item: ${item.name}");
  }

  // Calculate total price of items in cart
  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.price.value * item.quantity.value));
  }

  // Function to add items to Firestore database and navigate to checkout
  // Future<void> addItemsToDatabase() async {
  //   CollectionReference itemsCollection = FirebaseFirestore.instance.collection('items');

  //   List allItems = cartItems.map((item) {
  //     return {
  //       'name': item.name,
  //       'quantity': item.quantity.value,
  //       'total': item.price * item.quantity.value,
  //     };
  //   }).toList();

  //   try {
  //     await itemsCollection.add({
  //       'items': allItems,
  //       'total': totalPrice,
  //     });
  //     cartItems.clear(); // Clear cart after successful save
  //     update(); // Update UI
  //     Get.to(() => CheckOutScreen()); // Navigate to checkout screen
  //   } catch (error) {
  //     debugPrint("Error adding items to database: $error");
  //   }
  // }
}

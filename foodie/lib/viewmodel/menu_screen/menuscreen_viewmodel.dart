import 'package:foodie/viewmodel/menu_screen/addtocart_items.dart';
import 'package:get/get.dart';

class MenuScreenViewModel extends GetxController{
  RxBool udonChecked = false.obs;
  RxInt quantity = 1.obs;
  var cartItems = <CartItem>[].obs;
  var CartList = [].obs;

  addQuantity() {
    quantity++;
  }

  decreaseQuantity() {
    if (quantity > 0) {
      quantity--;
    } else {}
  }

  addtoCartFunc(String name,String price,String image,int qty){
    CartList.add({
      'name':name,
      'price':price,
      'Image':image,
      'qty':qty,
    }
    );

  }
}
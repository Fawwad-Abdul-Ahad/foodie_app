import 'package:foodie/services/api_service.dart';
import 'package:foodie/viewmodel/home1/productModel.dart';
import 'package:get/get.dart';

class RestaurantViewModel extends GetxController{
  var products= <productModel>[].obs;
  Future<void> FetchProducts() async {
    ApiSrvice apiService = ApiSrvice();
    var fetchedProducts = await apiService.getData();
    products.assignAll(fetchedProducts); // Update observable list
  }
}
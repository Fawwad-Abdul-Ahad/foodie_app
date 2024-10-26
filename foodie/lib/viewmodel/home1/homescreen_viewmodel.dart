import 'package:foodie/services/api_service.dart';
import 'package:foodie/viewmodel/home1/productModel.dart';
import 'package:get/get.dart';

class HomeScreenViewController extends GetxController{
  RxBool isCycle = true.obs;
  RxBool isWalk = false.obs;
  var products =<productModel>[].obs; 
  changeColorCycle(){
    isCycle.value = !isCycle.value;
    isWalk.value = !isWalk.value;
  }

  // changeColorWalk(){
  //   isCycle.value = !isCycle.value; 
  // }

  Future<void> FetchProducts() async {
    ApiSrvice apiService = ApiSrvice();
    var fetchedProducts = await apiService.getData();
    products.assignAll(fetchedProducts); // Update observable list
  }

}
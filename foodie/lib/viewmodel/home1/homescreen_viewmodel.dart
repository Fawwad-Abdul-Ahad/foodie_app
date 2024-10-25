import 'package:get/get.dart';

class HomeScreenViewController extends GetxController{
  RxBool isCycle = true.obs;
  RxBool isWalk = false.obs;
  changeColorCycle(){
    isCycle.value = !isCycle.value;
    isWalk.value = !isWalk.value;
  }

  // changeColorWalk(){
  //   isCycle.value = !isCycle.value; 
  // }



}
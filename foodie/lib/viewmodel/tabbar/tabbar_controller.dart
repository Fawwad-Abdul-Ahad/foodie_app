import 'package:flutter/widgets.dart';
import 'package:foodie/viewmodel/home1/homscreen_view.dart';
import 'package:get/get.dart';

class TabbarController extends GetxController{
  RxInt selectedTab = 0.obs;
  

  changeTab(int index){
    selectedTab.value = index;
  }
}
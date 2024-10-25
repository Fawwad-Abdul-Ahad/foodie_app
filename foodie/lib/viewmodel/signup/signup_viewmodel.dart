

import 'package:get/get.dart';

class SignupViewController extends GetxController{
  RxBool isObscure = true.obs;

  seePassword(){
    isObscure.value = !isObscure.value;
  }
}


import 'package:get/get.dart';

class LoginViewController extends GetxController{
  RxBool isObscure = true.obs;

  seePassword(){
    isObscure.value = !isObscure.value;
  }
}
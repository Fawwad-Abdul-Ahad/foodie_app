import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class LoginViewController extends GetxController{
  FirebaseAuth auth = FirebaseAuth.instance;
  RxBool isObscure = true.obs;

  seePassword(){
    isObscure.value = !isObscure.value;
  }

  Login(String email,String password)async{
    try {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
    Get.snackbar("Error", "User not found");
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
    Get.snackbar("Error","Please enter correct password");
  }
}
  }
}
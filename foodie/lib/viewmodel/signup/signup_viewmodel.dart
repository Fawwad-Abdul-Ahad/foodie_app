
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignupViewController extends GetxController{
  RxBool isObscure = true.obs;
   FirebaseAuth auth = FirebaseAuth.instance;
  seePassword(){
    isObscure.value = !isObscure.value;
  }
  Register(String email,String password)async{
    try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
    Get.snackbar("Warning", "Enter a strong password",);
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
    Get.snackbar("Error", "Email already exist");
  }
} catch (e) {
  print(e);
  Get.snackbar("Error", "pLease enter correct email or password");
}
  }
}
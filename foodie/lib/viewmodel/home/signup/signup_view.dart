import 'package:flutter/material.dart';
import 'package:foodie/components/text_component.dart';
import 'package:foodie/constants/colors.dart';
import 'package:foodie/viewmodel/home/login/login_viewmodel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  
  get formKey => null;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    LoginViewController controller = Get.put(LoginViewController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height; // Corrected typo

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Container(
                height: screenHeight,
                width: screenWidth,
                child: Image.asset(
                  "assets/images/bg.png",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 70,
                left: 50,
                right: 50,
                child: Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/images/Logo.png"),
                      Text(
                        "Deliver Food",
                        style: GoogleFonts.openSans(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 220,
                bottom: 150,
                left: 30,
                right: 30,
                child: Material(
                  elevation: 100,
                  borderRadius: BorderRadius.circular(19),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                    decoration: BoxDecoration(
                      color: kbgColor,
                      borderRadius: BorderRadius.circular(19),
                    ),
                    width: screenWidth * 0.1,
                    height: screenHeight * 0.6,
                    child: Obx(
                      () => Form(
                        key: formKey, // Used form key here
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style: GoogleFonts.openSans(
                                  fontSize: 28,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.05),
                              TextFormField(
                                controller: emailController,
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'example@gmail.com',
                                  hintStyle: GoogleFonts.openSans(
                                    color: Colors.white,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Email can't be empty";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: screenHeight * 0.03),
                              TextFormField(
                                obscureText: controller.isObscure.value,
                                controller: passController,
                                style: GoogleFonts.openSans(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      controller.seePassword();
                                    },
                                    child: Icon(
                                      controller.isObscure.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.white,
                                    ),
                                  ),
                                  hintText: 'password',
                                  hintStyle: GoogleFonts.openSans(
                                    color: Colors.white,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 6,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Password can't be empty";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              Container(
                                width: screenWidth,
                                height: screenHeight * 0.03,
                                child: Text(
                                  "Forgot Password?",
                                  textAlign: TextAlign.end,
                                  style: GoogleFonts.openSans(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.04),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(69, 91, 140, 1),
                                  minimumSize: Size(400, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    // Perform login action
                                  }
                                },
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.openSans(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.02),
                              Container(
                                width: screenWidth,
                                height: screenHeight * 0.06,
                                // color: Colors.white,
                                child: Center(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          "assets/images/facebook_icon.png"),
                                      SizedBox(width: screenWidth * 0.05),
                                      Image.asset('assets/images/google_icon.png'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 70,
                child: Container(
                  width: screenWidth,
                  height: screenHeight * 0.1,
                  // color: ,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextWidget(
                        text: 'Don\'t have an account?',
                        fontSize: 16,
                        fontweight: FontWeight.w500,
                        textColor: Colors.white,
                      ),
                      TextWidget(
                        text: "REGISTER",
                        fontSize: 20,
                        fontweight: FontWeight.w500,
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
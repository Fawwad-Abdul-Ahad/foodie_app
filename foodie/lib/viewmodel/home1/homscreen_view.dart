import 'package:flutter/material.dart';
import 'package:foodie/components/text_component.dart';
import 'package:foodie/viewmodel/home1/homescreen_viewmodel.dart';
import 'package:foodie/viewmodel/home1/widget/category_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    HomeScreenViewController controller = HomeScreenViewController();
      
    return Scaffold(
      body: Stack(

        children:[ 
          Container(
            // padding: EdgeInsets.all(1),
          width: screenWidth*1,
          height: screenHeight*1,
          child: Image.asset('assets/images/bg.png',fit: BoxFit.cover,),
        ),
        SafeArea(child: Positioned(child: SingleChildScrollView(
          child: Column(
            children: [Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
              width: screenWidth*1,
              height: screenHeight*0.1,
              // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.menu,size: 28,color: Colors.white,),
                  SizedBox( width:screenWidth*0.05),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(text: "Delivery", fontSize: 18, fontweight: FontWeight.w400, textColor: const Color.fromARGB(255, 144, 144, 144)),
                      TextWidget(text: 'Maplewood Suites', fontSize: 22, fontweight: FontWeight.w500, textColor: Colors.white),
            
                    ],
                  ),
                  SizedBox(width: screenWidth*0.05,),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color.fromARGB(255, 133, 131, 131)
                        
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            controller.changeColorCycle();
                          },
                          child:Obx(()=> Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(14),
                            child: Container(
                              decoration: BoxDecoration(
                              color: controller.isCycle.value? Color.fromRGBO(42, 92, 228, 0.698):Color.fromRGBO(15, 37, 96, 0.694),
                              borderRadius: BorderRadius.circular(12)
                              ),
                              width: screenWidth*0.11,
                              height: screenHeight*0.09,
                              child: Center(child: Image.asset('assets/images/cycle_icon.png',fit: BoxFit.contain,),),
                            ),
                          ),),
                        ),
                        InkWell(
                          onTap: (){
                            controller.changeColorCycle();
                          },
                          child: Obx(()=>Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(14),
                            child: Container(
                              decoration: BoxDecoration(
                              color:  controller.isCycle.value?Color.fromRGBO(15, 37, 96, 0.694): Color.fromRGBO(42, 92, 228, 0.698) ,
                              borderRadius: BorderRadius.circular(12)
                              ),
                              width: screenWidth*0.11,
                              height: screenHeight*1,
                              child: Image.asset('assets/images/walk_icon.png'),
                              // color: const Color.fromARGB(255, 33, 26, 25),
                            ),
                          ),),
                        ),  
                      ],  
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight*0.01,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22,vertical: 2),
              width: screenWidth*1,
              height: screenHeight*0.07,
              // color: Colors.red,
              child: Material(
                elevation: 2,
                color: const Color.fromARGB(0, 0, 0, 0),
                child: TextFormField(
                  style: GoogleFonts.openSans(fontSize: 18,color: Colors.white),
                  enabled: true,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.white
                      )
                    ),
                    hintText: 'Your Order?',
                    hintStyle: GoogleFonts.openSans(fontSize: 18,color: const Color.fromARGB(255, 166, 166, 166)),
                    prefixIcon: Icon(Icons.search,size: 24,color: Colors.white,),
                    border: OutlineInputBorder( 
                      borderRadius:BorderRadius.circular(12),
                    )
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight*0.01,),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 22),
              height: screenHeight*0.05,
              width: screenWidth*1,
              // color: const Color.fromARGB(255, 16, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(text: "Categories", fontSize: 18, fontweight: FontWeight.w600, textColor: Colors.white),
                    TextWidget(text: "see all", fontSize: 14, fontweight: FontWeight.w400, textColor: const Color.fromARGB(255, 205, 205, 205)),
                  ],
              ),
            ),
            // SizedBox(height: screenHeight*0.01,),
            Container(
              padding: EdgeInsets.symmetric(horizontal:  20,vertical: 6  ),
              width: screenWidth*1,
              height: screenHeight*0.15,
              // color: const Color.fromRGBO(0, 0, 0, 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CategoryWidget(image: 'assets/images/burger.png', name: 'Burgers'),
                  CategoryWidget(image: 'assets/images/cake.png', name: 'Desert'),
                  CategoryWidget(image: 'assets/images/mexican.png', name: 'Mexican'),
                  CategoryWidget(image: 'assets/images/sushi.png', name: 'Sushi'),
                  

                ],
              ),
            )
            ],
          ),
        )))
        ],
        
      ),
    );
  }
}
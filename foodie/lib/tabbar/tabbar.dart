import 'package:flutter/material.dart';
import 'package:foodie/tabbar/tabbar_controller.dart';
import 'package:foodie/viewmodel/home1/homscreen_view.dart';
import 'package:get/get.dart';

class TabBarViewScreen extends StatelessWidget {
  TabBarViewScreen({super.key});

  final List<Widget> _pages = [
    HomeScreen(),
    Center(child: Text("About")),
    Center(child: Text("Products")),
    Center(child: Text("Contact")),
    Center(child: Text("Settings")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return _pages[controller.selectedTab.value];
      }),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(82, 57, 36, 110),  // Custom background color
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255), // Set the selected item color here
        unselectedItemColor: const Color.fromARGB(255, 35, 29, 112),
        currentIndex: controller.selectedTab.value,
        onTap: (index) {
          controller.changeTab(index);
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_phone), label: 'Contact'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

final controller = Get.put(TabbarController());

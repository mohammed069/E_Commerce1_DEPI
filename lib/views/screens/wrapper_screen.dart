import 'package:e_commerce_depi/helpers/app_colors.dart';
import 'package:e_commerce_depi/views/screens/cart_screen.dart';
import 'package:e_commerce_depi/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

class WrapperScreen extends StatefulWidget {
  const WrapperScreen({super.key});

  @override
  State<WrapperScreen> createState() => _WrapperScreenState();
}

class _WrapperScreenState extends State<WrapperScreen> {
  int currentIndex = 0;
  List<Widget> screens = [const HomeScreen(), const CartScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
        backgroundColor: AppColors.backgroundColor,
        selectedItemColor: AppColors.textPrimaryColor,
        unselectedItemColor: AppColors.textSecondaryColor,
      ),
    );
  }
}

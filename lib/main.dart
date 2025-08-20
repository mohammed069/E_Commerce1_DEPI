import 'package:e_commerce_depi/controllers/add_to_cart_controller.dart';
import 'package:e_commerce_depi/helpers/router_config.dart';
import 'package:e_commerce_depi/views/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddToCartController(),
      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

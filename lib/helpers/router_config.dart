import 'package:e_commerce_depi/models/items_model.dart';
import 'package:e_commerce_depi/views/screens/cart_screen.dart';
import 'package:e_commerce_depi/views/screens/detailed_screen.dart';
import 'package:e_commerce_depi/views/screens/home_screen.dart';
import 'package:e_commerce_depi/views/screens/sign_up_screen.dart';
import 'package:e_commerce_depi/views/screens/wrapper_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WrapperScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/signup',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpScreen();
          },
        ),
        GoRoute(
          path: '/wrapper',
          builder: (BuildContext context, GoRouterState state) {
            return WrapperScreen();
          },
        ),
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
        GoRoute(
          path: '/details',
          builder: (BuildContext context, GoRouterState state) {
            final item = state.extra as ItemModel;
            return DetailedScreen(item: item);
          },
        ),
        GoRoute(
          path: '/cart',
          builder: (BuildContext context, GoRouterState state) {
            return const CartScreen();
          },
        ),
      ],
    ),
  ],
);

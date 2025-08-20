import 'package:e_commerce_depi/helpers/app_colors.dart';
import 'package:e_commerce_depi/models/items_model.dart';
import 'package:e_commerce_depi/views/widgets/category_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_depi/controllers/add_to_cart_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: AppColors.textPrimaryColor),
          onPressed: () {},
        ),
        title: const Text(
          'ShopSmart',
          style: TextStyle(
            color: AppColors.textPrimaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.textPrimaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8, bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F7FA),
                borderRadius: BorderRadius.circular(12),
              ),
              height: 48,
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.grey, size: 24),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Search',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CategoryButton(label: 'All', selected: true),
                const SizedBox(width: 8),
                CategoryButton(label: 'Featured'),
                const SizedBox(width: 8),
                CategoryButton(label: 'New'),
              ],
            ),
            Expanded(
              child: Consumer<AddToCartController>(
                builder: (context, cartController, _) {
                  return GridView.builder(
                    itemCount: fakeItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 24,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.7,
                        ),
                    itemBuilder: (context, index) {
                      final item = fakeItems[index];
                      final isInCart = cartController.isInCart(item);
                      return InkWell(
                        onTap: () {
                          context.push('/details', extra: item);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                    child: Image.asset(
                                      item.image,
                                      height: 150,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: IconButton(
                                      icon: Icon(
                                        isInCart
                                            ? Icons.shopping_cart
                                            : Icons.shopping_cart_outlined,
                                        color:
                                            isInCart
                                                ? AppColors.buttonColor
                                                : AppColors.textPrimaryColor,
                                      ),
                                      onPressed: () {
                                        if (!isInCart) {
                                          cartController.addToCart(item);
                                        } else {
                                          cartController.removeFromCart(item);
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '\$${item.price.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        color: AppColors.textSecondaryColor,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

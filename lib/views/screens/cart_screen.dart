import 'package:e_commerce_depi/helpers/app_colors.dart';
import 'package:e_commerce_depi/views/widgets/cart_circle_button.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_depi/models/items_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_depi/controllers/add_to_cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  double getSubtotal(List<ItemModel> cartItems) =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  double get taxes => 5.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Consumer<AddToCartController>(
          builder: (context, cartController, _) {
            final cartItems = cartController.cartItems;
            return Column(
              children: [
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    "Cart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: cartItems.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return InkWell(
                        onTap: () {
                          context.push('/details', extra: item);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                item.image,
                                width: 64,
                                height: 64,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '\$${item.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      color: Color(0xFF7B8BB2),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            CartCircleButton(
                              icon: Icons.remove,
                              onTap: () {
                                cartController.removeFromCart(item);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                              child: Text(
                                "${item.quantity}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            CartCircleButton(
                              icon: Icons.add,
                              onTap: () {
                                cartController.addToCart(item);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Text(
                        "Subtotal:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "\$${getSubtotal(cartItems).toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      const Text(
                        "Taxes:",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF7B8BB2),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "\$${taxes.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF7B8BB2),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1890FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Proceed to Checkout",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
            );
          },
        ),
      ),
    );
  }
}

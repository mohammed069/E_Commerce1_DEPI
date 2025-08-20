import 'package:flutter/material.dart';

class CartCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const CartCircleButton({required this.icon, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF5F7FA),
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 36,
          height: 36,
          child: Icon(icon, size: 20, color: Colors.black87),
        ),
      ),
    );
  }
}

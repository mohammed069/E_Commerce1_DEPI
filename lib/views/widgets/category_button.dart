import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final bool selected;
  const CategoryButton({required this.label, this.selected = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? const Color(0xFFF5F7FA) : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.black,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          fontSize: 16,
        ),
      ),
    );
  }
}

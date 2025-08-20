import 'package:e_commerce_depi/helpers/app_colors.dart';
import 'package:e_commerce_depi/models/items_model.dart';
import 'package:flutter/material.dart';

class DetailedScreen extends StatelessWidget {
  const DetailedScreen({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textPrimaryColor,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            item.image,
            fit: BoxFit.cover,
            height: 360,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              item.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimaryColor,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              item.description,
              style: TextStyle(fontSize: 16, color: AppColors.textPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}

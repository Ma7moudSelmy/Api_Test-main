import 'dart:ui';

import 'package:api_test/Models/Products_models.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductsModels product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 170,
      decoration: BoxDecoration(
        color: const Color(0xfff6f7f9),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          SizedBox(height: 120, child: Image.network(product.thumbnail)),
          Text(
            product.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                product.price.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(Icons.star, color: Colors.amber),
              Text(product.rating.toString()),
            ],
          ),
        ],
      ),
    );
  }
}

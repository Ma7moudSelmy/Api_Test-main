import 'package:flutter/material.dart';

class Productcard extends StatelessWidget {
  const Productcard({super.key, required this.product});
  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 170,
      decoration: BoxDecoration(
        color: Color(0xfff6f7f9),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          SizedBox(height: 120, child: Image.network(product['thumbnail'])),
          Text(
            product["title"].toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                product['price'].toString(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(Icons.star, color: Colors.amber),
            ],
          ),
        ],
      ),
    );
  }
}

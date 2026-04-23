import 'package:api_test/Models/Products_models.dart';
import 'package:api_test/main.dart';
import 'package:api_test/productCard/productCard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(backgroundColor: Colors.green),

      body: Center(
        child: FutureBuilder(
          future: getAllProducts(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              Response response = snapshot.data!;
              final dynamic data = response.data;
              List<ProductsModels> proudts = [];
              for (var proudtsmap in data['products']) {
                proudts.add(ProductsModels.fromjson(proudtsmap));
              }
              return GridView.builder(
                itemCount: proudts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 260,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: proudts[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

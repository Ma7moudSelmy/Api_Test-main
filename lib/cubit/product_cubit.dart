import 'dart:math';
import 'package:api_test/Models/Products_models.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  getAllProducts() async {
    emit(ProductLoading());
    final dio = Dio();
    final Response response = await dio.get('https://dummyjson.com/products');
    final dynamic data = response.data;
    List<ProductsModels> proudts = [];
    for (var proudtsmap in data['products']) {
      proudts.add(ProductsModels.fromjson(proudtsmap));
    }
    emit(ProductSuccess(proudts));
  }
}

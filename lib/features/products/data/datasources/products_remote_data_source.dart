import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nano_health/core/error/exceptions.dart';
import 'package:nano_health/core/network/network_info.dart';
import 'package:nano_health/features/products/data/models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final dio = Dio();
    final response = await dio.get("${NetworkInfo.baseUrl}""products",
        options: Options(headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        }));
      if (response.statusCode == 200) {
        print(response.data);
        final List decodedJson = response.data as List;
        final List<ProductModel> postModels = decodedJson
            .map<ProductModel>(
                (jsonPostModel) => ProductModel.fromJson(jsonPostModel))
            .toList();

        return postModels;
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }
}

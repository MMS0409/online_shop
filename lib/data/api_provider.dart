import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product/product_model.dart';
import '../models/universal_responce.dart';

class ProductApi {
  Future<UniversalResponse> getAllProducts(
      String categoy, String? sort, int limit) async {
    print(1);
    Uri uri = Uri.parse(
        "https://fakestoreapi.com/products$categoy?sort=$sort&limit=$limit");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
          data: (jsonDecode(response.body) as List?)
                  ?.map((e) => ProductModel.fromJson(e))
                  .toList() ??
              [],
        );
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      print("ERRROR$error");
      return UniversalResponse(error: error.toString());
    }
  }

  Future<UniversalResponse> getProductsById(int id) async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products/$id");
    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: ProductModel.fromJson(jsonDecode(response.body)));
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      print("ERRROR$error");
      return UniversalResponse(error: error.toString());
    }
  }

  Future<UniversalResponse> getProductsByDelete(int id) async {
    Uri uri = Uri.parse("https://fakestoreapi.com/products/$id");
    try {
      http.Response response = await http.delete(uri);

      if (response.statusCode == 200) {
        return UniversalResponse(
            data: ProductModel.fromJson(jsonDecode(response.body)));
      }
      return UniversalResponse(error: "ERROR");
    } catch (error) {
      print("ERRROR$error");
      return UniversalResponse(error: error.toString());
    }
  }
}
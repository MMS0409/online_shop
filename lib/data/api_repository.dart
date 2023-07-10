import '../models/product/product_model.dart';
import '../models/universal_responce.dart';
import 'api_provider.dart';

class RepositoryProductALL {
  // ignore: prefer_typing_uninitialized_variables
  final apiProvider;

  RepositoryProductALL({required this.apiProvider});

  Future<List<ProductModel>> fetchProductAll(
      String category, String sort, int limit) async {
    UniversalResponse universalResponse =
        await ProductApi().getAllProducts(category, sort, limit);
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<ProductModel>;
    }
    return [];
  }

  Future<List<ProductModel>> fetchProductById(int id) async {
    UniversalResponse universalResponse = await ProductApi().getProductsById(id);
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<ProductModel>;
    }
    return [];
  }

  Future<List<ProductModel>> fetchDeletID(int id) async {
    UniversalResponse universalResponse =
        await ProductApi().getProductsByDelete(id);
    if (universalResponse.error.isEmpty) {
      return universalResponse.data as List<ProductModel>;
    }
    return [];
  }
}
import 'package:assignment/src/core/networking/api_service.dart';
import 'package:assignment/src/core/networking/product_model.dart';

class HomeRepo {
  ApiService apiService;

  HomeRepo({required this.apiService});

  Future<List<Product>> getProducts() async {
    return await apiService.getProducts();
  }
}

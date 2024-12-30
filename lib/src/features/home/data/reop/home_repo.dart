import 'package:assignment/src/core/networking/api_service/api_service.dart';
import 'package:assignment/src/core/networking/models/product.dart';

class HomeRepo {
  ApiService apiService;

  HomeRepo({required this.apiService});

  Future<List<Product>> getProducts() async {
    return await apiService.getProducts();
  }
}

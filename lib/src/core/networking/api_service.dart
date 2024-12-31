import 'package:assignment/src/core/constants/app_strings.dart';
import 'package:assignment/src/core/networking/product_model.dart';
import 'package:dio/dio.dart';

// final dio = Dio();

// void request() async {

//   Response<List<Product>> response = await dio.get('${AppStrings.baseUrl}/products');

// }

abstract class ApiService {
  Future<List<Product>> getProducts();
}

class ApiServiceImp implements ApiService {
  final Dio dio;

  ApiServiceImp({required this.dio});
  @override
  Future<List<Product>> getProducts() async {
    Response<List<dynamic>> response =
        await dio.get('${AppStrings.baseUrl}/products');
    return response.data!.map((e) => Product.fromMap(e)).toList();
  }
}

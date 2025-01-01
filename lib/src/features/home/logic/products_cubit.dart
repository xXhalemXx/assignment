import 'package:assignment/src/core/networking/network_exceptions.dart';
import 'package:assignment/src/features/home/data/repo/home_repo.dart';
import 'package:assignment/src/features/home/logic/products_status.dart';
import 'package:bloc/bloc.dart';

// Cubit
class ProductsCubit extends Cubit<ProductsState> {
  HomeRepo repository;

  ProductsCubit({required this.repository}) : super(ProductsInitial());

  void fetchProducts() async {
    try {
      emit(ProductsLoading());
      final products = await repository.getProducts();
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError(NetworkExceptions.getDioExceptionMessage(e)));
    }
  }
}

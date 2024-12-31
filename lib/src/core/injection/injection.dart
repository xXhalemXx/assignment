import 'package:assignment/src/core/networking/api_service.dart';
import 'package:assignment/src/core/networking/dio_factory.dart';
import 'package:assignment/src/core/networking/product_model.dart';
import 'package:assignment/src/features/authentication/logic/auth_logic/auth_cubit.dart';
import 'package:assignment/src/features/authentication/logic/country_logic/country_cubit.dart';
import 'package:assignment/src/features/home/data/reop/home_repo.dart';
import 'package:assignment/src/features/home/logic/products_cubit.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiServiceImp(dio: dio));

  // HomeRepo
  getIt.registerLazySingleton<HomeRepo>(
      () => HomeRepo(apiService: getIt<ApiService>()));

  // ProductsCubit
  getIt.registerLazySingleton<ProductsCubit>(
      () => ProductsCubit(repository: getIt<HomeRepo>()));

  // Authentication Cubit
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit());

  getIt.registerLazySingleton<CountryCubit>(() => CountryCubit());
}

library route_pages;

import 'package:assignment/src/core/error/error.dart';
import 'package:assignment/src/core/injection/injection.dart';
import 'package:assignment/src/core/networking/product_model.dart';
import 'package:assignment/src/core/routes/names.dart';
import 'package:assignment/src/features/home/logic/products_cubit.dart';
import 'package:assignment/src/features/home/ui/screens/detail_screen.dart';
import 'package:assignment/src/features/home/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  static const initial = RoutesName.initial;
  static Route<dynamic> generate(RouteSettings? settings) {
    switch (settings?.name) {
      case RoutesName.initial:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: getIt<ProductsCubit>()..fetchProducts(),
            child: const HomeScreen(),
          ),
        );

      case RoutesName.detail:
        Product product = settings!.arguments as Product;
        return MaterialPageRoute(
          builder: (_) => DetailScreen(
            product: product,
          ),
        );

      default:
        // If there is no such named route in the switch statement
        throw const RouteException('Route not found!');
    }
  }
}

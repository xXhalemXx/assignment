import 'package:assignment/src/features/home/logic/products_cubit.dart';
import 'package:assignment/src/features/home/logic/products_status.dart';
import 'package:assignment/src/features/home/ui/widgets/error_body.dart';
import 'package:assignment/src/features/home/ui/widgets/home_app_bar.dart';
import 'package:assignment/src/features/home/ui/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return _loading();
          } else if (state is ProductsLoaded) {
            return ProductListBuilder(products: state.products);
          } else if (state is ProductsError) {
            return ErrorBody(errorMessage: state.message);
          }
          // default state (dead case)
          return Container();
        },
      ),
    );
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

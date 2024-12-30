import 'package:assignment/src/core/networking/models/product.dart';
import 'package:assignment/src/features/home/logic/products_cubit.dart';
import 'package:assignment/src/features/home/logic/products_status.dart';
import 'package:assignment/src/features/home/ui/widgets/home_app_bar.dart';
import 'package:assignment/src/features/home/ui/widgets/product_card.dart';
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
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsLoaded) {
            return _buildProductList(
                products: state.products, context: context);
          } else if (state is ProductsError) {
            return Center(child: Text(state.message));
          }
          // default state (dead case)
          return Container();
        },
      ),
    );
  }

  Widget _buildProductList(
      {required List<Product> products, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return ProductCard(product: products[index]);
        },
      ),
    );
  }
}

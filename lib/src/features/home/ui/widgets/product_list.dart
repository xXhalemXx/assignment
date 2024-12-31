import 'package:assignment/src/core/networking/product_model.dart';
import 'package:assignment/src/features/home/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductListBuilder extends StatelessWidget {
  final List<Product> products;
  const ProductListBuilder({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
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

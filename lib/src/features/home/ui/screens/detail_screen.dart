import 'package:assignment/src/core/constants/app_text_styles.dart';
import 'package:assignment/src/core/helpers/spacing.dart';
import 'package:assignment/src/core/networking/product_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _productImage(),
            verticalSpace(height: 20),
            _productTitle(),
            verticalSpace(height: 10),
            _productPrice(),
            verticalSpace(height: 10),
            _productDescription(),
            verticalSpace(height: 10),
            _productRating(),
          ],
        ),
      ),
    );
  }

  Widget _productImage() {
    return Center(
      child: Image.network(
        product.image,
        height: 250,
      ),
    );
  }

  Widget _productTitle() {
    return Text(
      product.title,
      style: AppTextStyles.defaultFont22Black100Bold1,
    );
  }

  Widget _productPrice() {
    return Text(
      '\$${product.price}',
      style: AppTextStyles.defaultFon20Green100regular1,
    );
  }

  Widget _productDescription() {
    return Text(
      product.description,
      style: AppTextStyles.defaultFont16Black100regular1,
    );
  }

  Widget _productRating() {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 5),
        Text('${product.rating.rate} (${product.rating.count} reviews)',
            style: AppTextStyles.defaultFont16Black100regular1),
      ],
    );
  }
}

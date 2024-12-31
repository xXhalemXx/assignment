import 'package:assignment/src/core/constants/app_text_styles.dart';
import 'package:assignment/src/core/helpers/spacing.dart';
import 'package:assignment/src/core/networking/product_model.dart';
import 'package:assignment/src/core/routes/names.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Product Details Screen
        Navigator.pushNamed(context, RoutesName.detail, arguments: product);
      },
      child: Card(
        color: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _productImage(),
              verticalSpace(height: 10),
              _productTitle(),
              verticalSpace(height: 10),
              _productPrice(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _productImage() {
    return Expanded(
      child: Image.network(
        product.image,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _productTitle() {
    return Text(
      product.title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.defaultFontDSizeBlack100Bold1,
    );
  }

  Widget _productPrice() {
    return Text(
      '\$${product.price}',
      style: AppTextStyles.defaultFont16Green100regular1,
    );
  }
}

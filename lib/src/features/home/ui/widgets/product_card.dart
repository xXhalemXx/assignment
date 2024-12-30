import 'package:assignment/src/core/networking/models/product.dart';
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
              // Product Image
              Expanded(
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 10),
              // Product Title
              Text(
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              // Product Price
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

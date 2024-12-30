import 'dart:convert';

class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      title: map['title'],
      price: double.parse(map['price'].toString()),
      description: map['description'],
      category: map['category'],
      image: map['image'],
      rating: Rating.fromMap(map['rating']),
    );
  }

  static List<Product> fromJsonList(String source) {
    Iterable l = json.decode(source);
    return List<Product>.from(l.map((model) => Product.fromMap(model)));
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      rate: double.parse(map['rate'].toString()),
      count: map['count'],
    );
  }
}

import 'dart:convert';

class Product {
  final String name;
  final bool isGood;
  Product({
    required this.name,
    required this.isGood,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'isGood': isGood,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      name: map['name'],
      isGood: map['isGood'],
    );
  }
}

final dummyProducts = [
  Product(name: 'Paneer', isGood: false),
  Product(name: 'Daal', isGood: true),
  Product(name: 'Laung', isGood: true),
  Product(name: 'Orange', isGood: false),
];

class Product {
  final String name;
  final bool healthy;
  final String frontImage;
  final String backImage;
  final String why;
  Product({
    required this.name,
    required this.healthy,
    required this.frontImage,
    required this.backImage,
    required this.why,
  });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'healthy': healthy,
  //   };
  // }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
        name: map['name'],
        healthy: map['healthy'],
        frontImage: map['front_img'],
        backImage: map['back_img'],
        why: map['why']);
  }
}

// final dummyProducts = [
//   Product(name: 'Paneer', healthy: false),
//   Product(name: 'Daal', healthy: true),
//   Product(name: 'Laung', healthy: true),
//   Product(name: 'Orange', healthy: false),
// ];

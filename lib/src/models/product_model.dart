class ProductModel {
  final String name;
  final double price;
  final String image;
  final String? description;

  ProductModel({
    required this.name,
    required this.price,
    required this.image,
    this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'].toDouble(),
      image: json['image'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'description': description,
    };
  }
}

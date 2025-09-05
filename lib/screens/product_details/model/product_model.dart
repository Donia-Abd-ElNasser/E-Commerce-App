class ProductModel {
  final String id;
  final String title;
  final String description;
  final int price;
  final List<String> images;
  final double rating;
  final int reviews;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.rating,
    required this.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      price: json['price'] ?? 0,
      images: List<String>.from(json['images'] ?? []),
      rating: (json['ratingsAverage'] ?? 0).toDouble(),
      reviews: json['ratingsQuantity'] ?? 0,
    );
  }
}

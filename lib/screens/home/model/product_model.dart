class ProductModel {
  final String id;
  final String title;
  final String description;
  final String imageCover;
  final double price;
  final double rating;
  final List<dynamic> images;
  final String categoryName;

  ProductModel({
    required this.rating,
    required this.categoryName,
    required this.id,
    required this.title,
    required this.description,
    required this.imageCover,
    required this.price,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["_id"],
      title: json["title"],
      description: json["description"] ?? "",
      imageCover: json["imageCover"],
      price:
          (json["price"] is int)
              ? (json["price"] as int).toDouble()
              : json["price"],
      images: json["images"] ?? [],
      categoryName: json['category']['name']??'',
      rating: (json['ratingsAverage'] is int)
    ? (json['ratingsAverage'] as int).toDouble()
    : (json['ratingsAverage'] as double),

    );
  }
}

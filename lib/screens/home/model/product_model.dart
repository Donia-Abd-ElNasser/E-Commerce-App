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
    id: json["_id"] ?? '',
    title: json["title"] ?? '',
    description: json["description"] ?? "",
    imageCover: json["imageCover"] ?? '',
    price: (json["price"] is num) ? (json["price"] as num).toDouble() : 0.0,
    images: json["images"] ?? [],
    categoryName: json['category']?['name'] ?? '',
    rating: (json['ratingsAverage'] is num)
        ? (json['ratingsAverage'] as num).toDouble()
        : 0.0,
  );
}Map<String, dynamic> toJson() => {
  "id": id,
  "title": title,
  "description": description,
  "imageCover": imageCover,
  "price": price,
};

}

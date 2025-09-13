class ItemModel {
  final String id;
  final String name;
  final String image;

  ItemModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json["_id"],
      name: json["name"],
      image: json["image"],
    );
  }
}

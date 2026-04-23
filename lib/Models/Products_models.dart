class ProductsModels {
  final int id;
  final String title;
  final double price;
  final List<dynamic> tags;
  final String thumbnail;
  final double rating;
  ProductsModels({
    required this.id,
    required this.title,
    required this.price,
    required this.tags,
    required this.thumbnail,
    required this.rating,
  });
  factory ProductsModels.fromjson(Map<String, dynamic> json) {
    return ProductsModels(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      tags: json['tags'],
      thumbnail: json['thumbnail'],
      rating: json['rating'],
    );
  }
}

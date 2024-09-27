class ProductModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final RatingModel? rating;
  final String category;

  ProductModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.rating,
      required this.category});
  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: (jsonData['price'] is String)
          ? double.tryParse(jsonData['price']) ?? 0.0
          : jsonData['price'].toDouble(),
      description: jsonData['description'],
      image: jsonData['image'],
      category: jsonData['category'],
      rating: jsonData['rating'] != null
          ? RatingModel.fromJson(jsonData['rating'])
          : null,
      // rating: RatingModel.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(jsonData) {
    return RatingModel(
        rate: (jsonData['rate'] is String)
            ? double.tryParse(jsonData['rate']) ?? 0.0
            : jsonData['rate'].toDouble(),

        // rate: (jsonData['rate'] is String)
        //     ? double.tryParse(jsonData['rate']) ??
        //         0.0 // Default to 0.0 if parsing fails
        //     : jsonData['rate'].toDouble(),
        // rate: jsonData['rate'],
        count: jsonData['count']);
  }
}

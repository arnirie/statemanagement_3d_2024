class Product {
  final String productCode;
  String nameDesc;
  double price;
  bool isFavorite;

  Product({
    required this.productCode,
    required this.nameDesc,
    required this.price,
    this.isFavorite = false,
  });
}

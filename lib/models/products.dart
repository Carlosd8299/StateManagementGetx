import 'package:meta/meta.dart' show required;

class Product {
  final String nombre, description;
  final double price, rate;
  final int id;
  bool isfavorited = false;

  Product({
    @required this.id,
    @required this.nombre,
    @required this.description,
    @required this.price,
    @required this.rate,
  });

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['Product ID'],
        nombre: json['Name'],
        description: json['Description'],
        price: json['Price'].toDouble(),
        rate: json['Rating Avg'].toDouble());
  }
}

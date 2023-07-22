import 'package:magdsoft_flutter_structure/data/models/product_model.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/product_web_services.dart';

class ProductRepository {
  final ProductsWebservices _productsWebservices;
  ProductRepository(this._productsWebservices);
  Future<List<Products>> getAllProducts() async {
    final products = await _productsWebservices.getAllProducts();
    return products.map((products) => Products.fromJson(products)).toList();
  }
}

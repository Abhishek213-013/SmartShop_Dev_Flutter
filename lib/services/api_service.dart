import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> productListJson = json.decode(response.body);
      return productListJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<List<String>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/products/categories'));

    if (response.statusCode == 200) {
      final List<dynamic> categoriesJson = json.decode(response.body);
      return categoriesJson.cast<String>();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  Future<List<Product>> fetchProductsByCategory(String category) async {
    final response =
    await http.get(Uri.parse('$baseUrl/products/category/$category'));

    if (response.statusCode == 200) {
      final List<dynamic> productListJson = json.decode(response.body);
      return productListJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products for category $category');
    }
  }
}

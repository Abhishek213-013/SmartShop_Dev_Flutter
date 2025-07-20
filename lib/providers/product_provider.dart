import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';

enum SortOption { priceLowToHigh, priceHighToLow, ratingHighToLow }

class ProductProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Product> _products = [];
  List<Product> get products => _products;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  SortOption? _sortOption;
  SortOption? get sortOption => _sortOption;

  String? _selectedCategory;
  String? get selectedCategory => _selectedCategory;

  List<String> _categories = [];
  List<String> get categories => _categories;

  Future<void> fetchCategories() async {
    try {
      _categories = await _apiService.fetchCategories();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> fetchProducts({String? category}) async {
    _isLoading = true;
    notifyListeners();

    try {
      if (category != null) {
        _selectedCategory = category;
        _products = await _apiService.fetchProductsByCategory(category);
      } else {
        _selectedCategory = null;
        _products = await _apiService.fetchProducts();
      }
      if (_sortOption != null) {
        sortProducts(_sortOption!);
      }
    } catch (e) {
      _products = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void sortProducts(SortOption option) {
    _sortOption = option;
    switch (option) {
      case SortOption.priceLowToHigh:
        _products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case SortOption.priceHighToLow:
        _products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case SortOption.ratingHighToLow:
        _products.sort((a, b) => b.rating.compareTo(a.rating));
        break;
    }
    notifyListeners();
  }
}

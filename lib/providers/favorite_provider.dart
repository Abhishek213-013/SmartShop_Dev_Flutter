import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Product> _favorites = [];

  List<Product> get favorites => [..._favorites];

  Future<void> toggleFavorite(Product product) async {
    if (isFavorite(product.id)) {
      _favorites.removeWhere((item) => item.id == product.id);
    } else {
      _favorites.add(product);
    }
    await _saveFavorites();
    notifyListeners();
  }

  bool isFavorite(int productId) {
    return _favorites.any((item) => item.id == productId);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> storedIds = prefs.getStringList('favoriteIds') ?? [];
    _favorites.removeWhere((product) => !storedIds.contains(product.id.toString()));
    notifyListeners();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> ids = _favorites.map((e) => e.id.toString()).toList();
    await prefs.setStringList('favoriteIds', ids);
  }
}

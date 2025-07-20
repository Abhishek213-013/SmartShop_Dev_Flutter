import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/favorite_provider.dart';
import '../../models/product.dart';
import '../widgets/product_tile.dart';
import '../../providers/cart_provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final favorites = favoriteProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorite products yet.'))
          : GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: favorites.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          Product product = favorites[index];
          return ProductTile(
            product: product,
            isFavorite: true,
            onFavoriteToggle: () =>
                favoriteProvider.toggleFavorite(product),
            onAddToCart: () => cartProvider.addItem(product),
          );
        },
      ),
    );
  }
}

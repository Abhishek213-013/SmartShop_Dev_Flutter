import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product.dart';
import '../../providers/cart_provider.dart';
import '../../providers/favorite_provider.dart';
import '../../providers/product_provider.dart';
import '../../routes/app_routes.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/product_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final productProvider = Provider.of<ProductProvider>(context, listen: false);
    productProvider.fetchCategories();
    productProvider.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              productProvider.sortProducts(value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: SortOption.priceLowToHigh,
                child: Text('Price: Low to High'),
              ),
              const PopupMenuItem(
                value: SortOption.priceHighToLow,
                child: Text('Price: High to Low'),
              ),
              const PopupMenuItem(
                value: SortOption.ratingHighToLow,
                child: Text('Rating: High to Low'),
              ),
            ],
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.cart);
                },
              ),
              if (cartProvider.itemCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text(
                      cartProvider.itemCount.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: RefreshIndicator(
        onRefresh: () async {
          await productProvider.fetchProducts(category: productProvider.selectedCategory);
        },
        child: Column(
          children: [
            if (productProvider.categories.isNotEmpty)
              SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productProvider.categories.length,
                  itemBuilder: (context, index) {
                    final category = productProvider.categories[index];
                    final isSelected = category == productProvider.selectedCategory;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      child: ChoiceChip(
                        label: Text(category),
                        selected: isSelected,
                        onSelected: (_) {
                          productProvider.fetchProducts(category: category);
                        },
                      ),
                    );
                  },
                ),
              ),
            if (productProvider.isLoading)
              const Expanded(child: Center(child: CircularProgressIndicator()))
            else if (productProvider.products.isEmpty)
              const Expanded(child: Center(child: Text('No products found.')))
            else
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: productProvider.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    final product = productProvider.products[index];
                    final isFav = favoriteProvider.isFavorite(product.id);
                    return ProductTile(
                      product: product,
                      isFavorite: isFav,
                      onFavoriteToggle: () =>
                          favoriteProvider.toggleFavorite(product),
                      onAddToCart: () => cartProvider.addItem(product),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

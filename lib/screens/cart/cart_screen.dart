import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../models/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final items = cartProvider.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        actions: [
          if (items.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_forever),
              onPressed: () {
                cartProvider.clearCart();
              },
              tooltip: 'Clear Cart',
            )
        ],
      ),
      body: items.isEmpty
          ? const Center(child: Text('Your cart is empty.'))
          : ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          Product product = items[index];
          return ListTile(
            leading: Image.network(product.image, width: 50, height: 50),
            title: Text(product.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$${product.price.toStringAsFixed(2)}'),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(product.rating.toStringAsFixed(1)),
                  ],
                ),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle, color: Colors.red),
              onPressed: () => cartProvider.removeItem(product.id),
            ),
          );
        },
      ),
      bottomNavigationBar: items.isNotEmpty
          ? Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Total:', style: TextStyle(fontSize: 18)),
            Text(
              '\$${cartProvider.totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      )
          : null,
    );
  }
}

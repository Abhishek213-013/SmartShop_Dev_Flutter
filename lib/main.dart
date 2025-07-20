import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/theme_notifier.dart';
import 'providers/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/favorite_provider.dart';
import 'providers/product_provider.dart';
import 'routes/app_routes.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const SmartShopApp());
}

class SmartShopApp extends StatelessWidget {
  const SmartShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ],
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Smart Shop',
            theme: themeNotifier.currentTheme,
            onGenerateRoute: AppRoutes.generateRoute,
            // You can also use `initialRoute` if needed.
            home: const SplashScreen(), // ✅ Entry screen
          );
        },
      ),
    );
  }
}

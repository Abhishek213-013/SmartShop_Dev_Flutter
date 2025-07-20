# SmartShop_Dev_Flutter
Smart Shop

A Flutter-based e-commerce mobile application featuring user authentication, product browsing, cart management, favorites, and theming support.
Project Overview

Smart Shop is a modern, user-friendly shopping app built with Flutter and Provider state management. It includes:

    Splash screen with app logo

    User login and registration with validation

    Product listing and details

    Shopping cart functionality

    Favorite products management

    Light and dark theme support

    Persistent login state using shared preferences (optional)

    Clean architecture with separation of concerns



Features

    Splash Screen: Shows the app logo for 2-3 seconds at startup.

    Login & Registration: User authentication with form validation.

    Theming: Support for light and dark themes using ThemeNotifier.

    State Management: Uses Provider for auth, product, cart, and favorites state.

    Routing: Centralized route management in app_routes.dart.

    Background Images: Customized backgrounds for splash and login screens.

    Error Handling: Displays validation and login error messages clearly.

Getting Started
Prerequisites

    Flutter SDK (>= 3.0.0)

    Dart SDK

    Android Studio / VS Code or your preferred IDE

    Connected device or emulator

Setup

    Clone the repository:

git clone https://github.com/Abhishek213-013/SmartShop_Dev_Flutter.git
cd SmartShop_Dev_Flutter

Install dependencies:

flutter pub get

Add assets

Make sure the following assets are in the assets/ folder and declared in pubspec.yaml:

    app_logo.png

    login_bg.png

    logo.png (for splash screen)

Run the app:

    flutter run

Folder Structure Details

    core/: Contains app constants, theme definitions (light/dark), and utility functions such as validators.

    models/: Contains data classes for users, products, and cart items.

    providers/: Implements the state management logic using ChangeNotifier for different app modules.

    services/: Responsible for API calls and authentication logic.

    screens/: UI code separated by features (auth, home, cart, etc.).

    routes/: Defines named routes and handles navigation.

    storage/: Utility for persistent storage like SharedPreferences.

Dependencies

    flutter

    provider

    shared_preferences (if used)

    Other packages as per pubspec.yaml

License

Specify your license here (e.g., MIT, Apache 2.0).
Contact

For questions or support, contact:

Your Name — abhishekchowdhury054@gmail.com
GitHub: https://github.com/Abhishek213-013

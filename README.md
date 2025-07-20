# 🛍️ Smart Shop – E-Commerce App Using Flutter

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



---

## 📸 Screenshots

### 🔐 Splash & Login Screens

![Splash, Login](https://raw.githubusercontent.com/Abhishek213-013/SmartShop_Dev_Flutter/main/assets/picture-1.jpg)

---

### 🏠 Home, Favourites & Cart Screens

![Home, Favourite, Cart](https://raw.githubusercontent.com/Abhishek213-013/SmartShop_Dev_Flutter/main/assets/picture-2.jpg)

---

### 🌙 Dark Mode & Menu

![Dark Mode, Menu](https://raw.githubusercontent.com/Abhishek213-013/SmartShop_Dev_Flutter/main/assets/picture-3.jpg)

---

## 🔧 Features

- ✅ User Sign Up / Login with local storage
- 🛍 Product Listing with images and prices
- ❤️ Add & Remove Favourites
- 🛒 Add to Cart & Quantity Updates
- 🌙 Light / Dark Mode Toggle
- 🧠 Product Sorting by:
    - Price (Low to High, High to Low)
    - Rating
- 📂 Filter Products by Categories:
    - 👕 Cloth
    - 💎 Jewellery
    - 📱 Gadget
- 🔐 Secure Logout and Session Management

---

## 🚀 Getting Started

### 1. Clone the repository
```bash
git clone https://github.com/Abhishek213-013/SmartShop_Dev_Flutter.git
cd SmartShop_Dev_Flutter
Install dependencies  "flutter pub get"
Project Structure

lib/
├── main.dart                # Entry point
├── core/                   # Constants, themes, utils
│   ├── constants/
│   ├── theme/
│   └── utils/
├── models/                  # Data models (User, Product, CartItem)
├── providers/               # State management providers
├── services/                # API and authentication services
├── screens/                 # UI Screens (auth, home, cart, etc.)
├── routes/                  # App routes and navigation                
assets/
├── app_logo.png             # App logo used in splash and login
├── login_bg.png             # Login screen background image
└── ...                      # Other assets (icons, images)

Author
Abhishek Chowdhury
https://github.com/Abhishek213-013

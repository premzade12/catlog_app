# 🛒 Flutter Catalog App

A **mini e-commerce application** built with **Flutter** and **VelocityX**.  
This app demonstrates product catalog browsing, product details, and cart management – making it a great starting point for learning Flutter or building a full-fledged e-commerce app.

---

## 📖 About

The **Flutter Catalog App** is a simple yet powerful project designed for developers who want to understand the fundamentals of building shopping apps with Flutter.  

Key highlights:
- 📂 **Catalog Display** – browse products loaded from a JSON file  
- 🔍 **Product Details** – view detailed description of each product  
- 🛒 **Cart Management** – add/remove products dynamically  
- 💰 **Dynamic Pricing** – automatic total price calculation  
- 🎨 **Theming** – light & dark theme support using **VelocityX**  

---

## 🚀 Features

- Beautiful product catalog with images, prices, and descriptions  
- Smooth navigation between home, product details, and cart pages  
- Cart badge showing number of items added  
- Remove items directly from the cart  
- Total price calculation in real-time  
- Beginner-friendly structure following clean code practices  

---

## 🛠️ Tech Stack

- **Flutter** (UI framework)  
- **Dart** (programming language)  
- **Provider** (state management)  
- **VelocityX** (UI toolkit)  
- **JSON Assets** (for catalog data)  

---

## 📂 Project Structure

lib/
├─ main.dart # App entry point
├─ models/
│ ├─ catalog.dart # Product model
│ ├─ cart.dart # Cart model
├─ utils/
│ ├─ routes.dart # App routes
│ ├─ themes.dart # App themes
│ └─ widgets/
│ ├─ home_widgets/ # Home screen widgets
│ └─ drawer.dart
├─ pages/
│ ├─ home_page.dart # Catalog page
│ ├─ home_details_page.dart# Product details
│ └─ cart_page.dart # Cart page
└─ assets/
└─ files/catalog.json # Sample product data

## 🏗️ Getting Started

Follow these steps to run the app locally:

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/flutter-catalog-app.git
   cd flutter-catalog-app
Install dependencies

bash
Copy
Edit
flutter pub get
Run the app

bash
Copy
Edit
flutter run
📸 Screenshots
Home Page	Product Details	Cart Page

(Add your own screenshots in assets/screenshots/ and update paths above)

🎯 Future Improvements
Add checkout and payment integration

Use API instead of static JSON for products

Implement user authentication

Enhance UI/UX with animations

🤝 Contributing
Contributions are welcome!
Feel free to fork this repo, open an issue, or submit a pull request with improvements.



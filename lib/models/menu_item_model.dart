import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantID;
  final String name;
  // final Image imageUrl;
  final String category;
  final String description;
  final double price;

  MenuItem(
      {required this.id,
      required this.restaurantID,
      required this.name,
      required this.category,
      required this.description,
      required this.price});

  @override
  List<Object?> get props => [
        id,
        restaurantID,
        name,
        description,
        price,
      ];

  static List<MenuItem> menuItems = [
    MenuItem(
      id: 1,
      restaurantID: 1,
      name: "Char Kway Teow",
      category: "Noodle",
      description:
          "Wok-fried flat noodles in high flame loaded with prawns, coockes, fish cakes, egg, chives and bean",
      price: 15.50,
    ),
    MenuItem(
      id: 1,
      restaurantID: 1,
      name: "Wan Tan Hor",
      category: "Rice",
      description:
          "Translated literally to slippery egg noodles, this wok-fried kway teow dish gets it's name from the soupy egg noodles with prawn, chicken slices, fish cakes and vegetables",
      price: 17.45,
    ),
    MenuItem(
      id: 1,
      restaurantID: 1,
      name: "Sago Gula Melaka",
      category: "Dessert",
      description: "Popular Sago dessert with gula melaka added on",
      price: 7.6,
    ),
    MenuItem(
      id: 2,
      restaurantID: 2,
      name: "Zinger Burger",
      category: "Burger",
      description: "The BEST burger in the shop",
      price: 19.9,
    ),
    MenuItem(
      id: 2,
      restaurantID: 2,
      name: "Tosai",
      category: "Burger",
      description: "Indian best handmake bread",
      price: 2.8,
    ),
    MenuItem(
      id: 2,
      restaurantID: 2,
      name: "Bihun Goreng",
      category: "Noodle",
      description: "Fried Noodle with delicious custom sauce",
      price: 5.20,
    ),
    MenuItem(
      id: 3,
      restaurantID: 3,
      name: "Genius Cream",
      category: "Dessert",
      description: "Top 1 Popular Ice-Cream in shop",
      price: 20.9,
    ),
    MenuItem(
      id: 3,
      restaurantID: 3,
      name: "Half-Genius Cream",
      category: "Dessert",
      description: "Top 2 Popular Ice-Cream in shop",
      price: 19.9,
    ),
    MenuItem(
      id: 3,
      restaurantID: 3,
      name: "Non-Genius Cream",
      category: "Dessert",
      description: "Top 3 Popular Ice-Cream in shop",
      price: 9.9,
    ),
    MenuItem(
      id: 4,
      restaurantID: 4,
      name: "Good Luck Cluck",
      category: "Rice",
      description: "Family Set rice with fried chicken dipped in ginger chilli sause",
      price: 18.6,
    ),
    MenuItem(
      id: 4,
      restaurantID: 4,
      name: "Coca-Cola",
      category: "Drink",
      description: "Best Soda Drink",
      price: 2.25,
    ),
    MenuItem(
      id: 4,
      restaurantID: 4,
      name: "Sprite",
      category: "Drink",
      description: "Recommende Soda Drink",
      price: 3.99,
    ),
    MenuItem(
      id: 5,
      restaurantID: 5,
      name: "Fries",
      category: "Burger",
      description: "Salted Fries",
      price: 1.99,
    ),
    MenuItem(
      id: 5,
      restaurantID: 5,
      name: "Original Chickwich",
      category: "Rice",
      description: "Fried Rice with deep-fried boneless chicken thigh with cheesey sauce",
      price: 1.99,
    ),
  ];
}

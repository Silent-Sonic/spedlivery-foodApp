import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
import 'models.dart';

class Restaurant extends Equatable {
  final int id;
  final String imagePath;
  final String shop;
  final String name;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final String priceCategory;
  final double deliveryFee;
  final double distance;

  Restaurant({
    required this.id,
    required this.imagePath,
    required this.shop,
    required this.name,
    required this.tags,
    required this.menuItems,
    required this.deliveryTime,
    required this.priceCategory,
    required this.deliveryFee,
    required this.distance,
  });

  @override
  List<Object?> get props => [
        id,
        imagePath,
        shop,
        name,
        tags,
        menuItems,
        deliveryTime,
        priceCategory,
        deliveryFee,
        distance,
      ];
  static List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      imagePath: "assets/image/restaurant_paparich.jpg",
      shop: "assets/image/restaurant_topRated_1.jpg",
      name: "PappaRich Cafe",
      // tags: [
      //   "Asian",
      //   "Noodles",
      //   "Malaysian Food",
      //   "Southeast Asian",
      //   "Halal",
      // ],
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantID == 1)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantID == 1)
          .toList(),
      deliveryTime: 7,
      priceCategory: "\$\$",
      deliveryFee: 1.00,
      distance: 1.3,
    ),
    Restaurant(
      id: 2,
      imagePath: "assets/image/restaurant_vincentCorner.jpg",
      shop: "assets/image/restaurant_topRated_2.jpg",
      name: "Vincent Corner",
      // tags: [
      //   "Asian",
      //   "Noodles",
      //   "Tosai",
      //   "Rice Dishes",
      //   "Southeast Asian",
      // ],
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantID == 2)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantID == 2)
          .toList(),
      deliveryTime: 45,
      priceCategory: "\$\$\$",
      deliveryFee: 4.30,
      distance: 9.6,
    ),
    Restaurant(
      id: 3,
      imagePath: "assets/image/restaurant_maccalDelivery.jpg",
      shop: "assets/image/restaurant_topRated_3.png",
      name: "Maccal Delivery",
      // tags: [
      //   "Asian",
      //   "Beverage",
      //   "A La Carte",
      //   "Pizza",
      // ],
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantID == 3)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantID == 3)
          .toList(),
      deliveryTime: 19,
      priceCategory: "\$",
      deliveryFee: 2.70,
      distance: 2.6,
    ),
    Restaurant(
      id: 4,
      imagePath: "assets/image/restaurant_knowhereBangsar.jpg",
      shop: "assets/image/restaurant_topRated_4.jpg",
      name: "Knowhere Bangsar",
      // tags: [
      //   "Italian",
      //   "Burgers",
      //   "Pasta",
      //   "European",
      //   "Pandapro Perks",
      // ],
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantID == 4)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantID == 4)
          .toList(),
      deliveryTime: 13,
      priceCategory: "\$",
      deliveryFee: 1.95,
      distance: 2.15,
    ),
    Restaurant(
      id: 5,
      imagePath: "assets/image/restaurant_chickwich.jpg",
      shop: "assets/image/restaurant_topRated_5.jpg",
      name: "Chickwich",
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantID == 5)
          .map((menuItem) => menuItem.category)
          .toSet()
          .toList(),
      // tags: [
      //   "American",
      // "Meat",
      // "Chicken",
      // "Western",
      // ],
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantID == 5)
          .toList(),
      deliveryTime: 37,
      priceCategory: "\$\$",
      deliveryFee: 3.65,
      distance: 11.7,
    ),
  ];
}

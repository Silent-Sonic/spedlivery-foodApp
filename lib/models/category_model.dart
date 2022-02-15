import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final Image image;

  Category({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, image];

  static List<Category> categories = [
    Category(
      id: 1,
      name: "Rice",
      image: Image.asset("assets/image/homepage_rice.png"),
    ),
    Category(
      id: 2,
      name: "Burger",
      image: Image.asset("assets/image/homepage_burger.png"),
    ),
    Category(
      id: 3,
      name: "Dessert",
      image: Image.asset("assets/image/homepage_dessert.png"),
    ),
    Category(
      id: 4,
      name: "Noodle",
      image: Image.asset("assets/image/homepage_noodle.png"),
    ),
    Category(
      id: 5,
      name: "Drink",
      image: Image.asset("assets/image/homepage_drink.png"),
    ),
  ];
}

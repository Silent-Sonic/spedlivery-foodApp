import 'package:flutter/material.dart';
import 'package:food_delivery_application/models/models.dart';

class CategoryBox extends StatelessWidget {
  final Category category;
  const CategoryBox({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Restaurant> restaurant = Restaurant.restaurants
        .where((restaurant) => restaurant.tags.contains(category.name))
        .toList();

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          "/restaurant-listing",
          arguments: restaurant,
        );
      },
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(7.0),
        ),
        margin: EdgeInsets.only(right: 5.0),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.all(1.0),
                height: 60,
                width: 60,
                child: category.image,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  category.name,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_application/models/models.dart';
import 'package:food_delivery_application/screens/widget/public_topAppbar.dart';
import 'package:food_delivery_application/screens/widget/widgets.dart';

class RestaurantListingScreen extends StatelessWidget {
  final List<Restaurant> restaurants;
  const RestaurantListingScreen({Key? key, required this.restaurants})
      : super(key: key);
  static const String routeName = "/restaurant-listing";

  static Route route({required List<Restaurant> restaurants}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantListingScreen(restaurants: restaurants),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PublicTopAppBar(title: "Restaurants",icon: Icon(CupertinoIcons.back),),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return RestaurantCard(restaurant: restaurants[index]);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_application/models/models.dart';
import 'restaurant_tags.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          "/restaurant-details",
          arguments: restaurant,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 8.5),
                  width: MediaQuery.of(context).size.width,
                  height: 170.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(23),
                      bottomLeft: Radius.circular(23),
                    ),
                    image: DecorationImage(
                      image: AssetImage(restaurant.shop),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    alignment: Alignment.center,
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      "${restaurant.deliveryTime} min",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(height: 5),
                  // Text("${restaurant.tags}"),
                  RestaurantTags(
                    restaurant: restaurant,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${restaurant.distance} KM  -  \$ ${restaurant.deliveryFee} delivery fee",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_application/models/models.dart';
import 'widgets.dart';

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantInformation({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          SizedBox(height: 10),
          RestaurantTags(restaurant: restaurant),
          SizedBox(height: 5),
          Text(
            "${restaurant.distance} KM away - \$${restaurant.deliveryFee} delivery fee",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
          Text(
            "Restaurant Information",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 5),
          Text(
            "Serving up the taste of home with a promise of delivering a truly Malaysian experience anytime, anywhere.",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}

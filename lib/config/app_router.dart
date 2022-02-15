import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_application/models/models.dart';
import 'package:food_delivery_application/screens/basket/basket_screen.dart';
import 'package:food_delivery_application/screens/basket/edit_basket/edit_basket_screen.dart';
import 'package:food_delivery_application/screens/checkout/checkout_screen.dart';
import 'package:food_delivery_application/screens/delivery_time/delivery_time_screen.dart';
import 'package:food_delivery_application/screens/filter/filter_screen.dart';
import 'package:food_delivery_application/screens/home/home_screen.dart';
// import 'package:food_delivery_application/screens/location/location_screen.dart';
import 'package:food_delivery_application/screens/restaurant_listing/restaurant_listing_screen.dart';
import 'package:food_delivery_application/screens/retaurant_details/restaurant_details_screen.dart';
import 'package:food_delivery_application/screens/voucher/voucher_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print("The Route is : ${settings.name} ");
    switch (settings.name) {
      case "/":
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      // case LocationScreen.routeName:
      //   return LocationScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
        case EditBasketScreen.routeName:
        return EditBasketScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case RestaurantListingScreen.routeName:
        return RestaurantListingScreen.route(
            restaurants: settings.arguments as List<Restaurant>);
      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route(
          restaurant: settings.arguments as Restaurant,
        );
      case VoucherScreen.routeName:
        return VoucherScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: Navigator.of(context).pop,
        ),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Error"),
          centerTitle: true,
        ),
        body: Center(
          child: Text(
            "Oops, something went wrong!",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
      settings: RouteSettings(name: "/error"),
    );
  }
}

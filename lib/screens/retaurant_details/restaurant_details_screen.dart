import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_application/blocs/basket/basket_bloc.dart';
import 'package:food_delivery_application/models/restaurant_model.dart';
import 'package:food_delivery_application/screens/widget/public_bottomAppbar.dart';
import 'package:food_delivery_application/screens/widget/widgets.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  static const String routeName = "/restaurant-details";
  final Restaurant restaurant;
  const RestaurantDetailsScreen({required this.restaurant});

  static Route route({required Restaurant restaurant}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantDetailsScreen(restaurant: restaurant),
      settings: RouteSettings(name: routeName, arguments: restaurant),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Restaurant restaurant = Restaurant.restaurants[0];
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: Navigator.of(context).pop,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: PublicBottomAppBar(
        text: "Basket",
        functionApply: () {
          Navigator.pushNamed(context, "/basket");
        },
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom:
                      Radius.elliptical(MediaQuery.of(context).size.width, 50),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(restaurant.shop),
                ),
              ),
            ),
            RestaurantInformation(restaurant: restaurant),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: restaurant.tags.length,
              itemBuilder: (context, index) {
                return _buildMenuItems(restaurant, context, index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItems(
      Restaurant restaurant, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            restaurant.tags[index],
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
        Column(
          children: restaurant.menuItems
              .where((menuItem) => menuItem.category == restaurant.tags[index])
              .map(
                (menuItem) => Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          menuItem.name,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        subtitle: Text(
                          menuItem.description,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("\$${menuItem.price}",
                                style: Theme.of(context).textTheme.bodyText1),
                            BlocBuilder<BasketBloc, BasketState>(
                              builder: (context, state) => IconButton(
                                splashColor: Theme.of(context).primaryColor,
                                onPressed: () {
                                  context.read<BasketBloc>()
                                    ..add(
                                      AddItem(menuItem),
                                    );
                                },
                                icon: Icon(
                                  CupertinoIcons.add_circled,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

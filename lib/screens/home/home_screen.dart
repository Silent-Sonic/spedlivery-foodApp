import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_application/models/models.dart';
import 'package:food_delivery_application/screens/widget/promo_box.dart';
import 'package:food_delivery_application/screens/widget/restaurant_card.dart';
import '../widget/category_box.dart';
import '../widget/food_search_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String routeName = "/";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => HomeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      onHorizontalDragStart: (f) {
        Navigator.of(context).pushNamed("/basket");
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(7.5),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: Category.categories.length,
                    itemBuilder: (context, index) {
                      return CategoryBox(
                        category: Category.categories[index],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.5),
                child: SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: Promo.promos.length,
                    itemBuilder: (context, index) {
                      return PromoBox(
                        promo: Promo.promos[index],
                      );
                    },
                  ),
                ),
              ),
              FoodSearchBox(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Top Rated",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: Restaurant.restaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(
                    restaurant: Restaurant.restaurants[index],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      leading: IconButton(
        icon: Icon(CupertinoIcons.person),
        onPressed: () {},
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "CURRENT LOCATION",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: Colors.white,
                ),
          ),
          Text(
            "Singapore, 1 Shenton Way",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}

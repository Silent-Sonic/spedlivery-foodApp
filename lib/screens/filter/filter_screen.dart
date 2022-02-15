import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_application/blocs/filters/filters_bloc.dart';
import 'package:food_delivery_application/models/models.dart';
import 'package:food_delivery_application/screens/widget/public_topAppbar.dart';

import 'custom_category_filter.dart';
import 'custom_price_filter.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);
  static const String routeName = "/filters";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => FilterScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PublicTopAppBar(
        title: "Filter",
        icon: Icon(CupertinoIcons.back),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Price",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            CustomPriceFilter(),
            Text(
              "Category",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            CustomCategoryFilter(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<FiltersBloc, FiltersState>(
                builder: (context, state) {
                  if (state is FiltersLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  }

                  if (state is FiltersLoaded) {
                    return ElevatedButton(
                      onPressed: () {
                        var categories = state.filter.categoryFilters
                            .where((filter) => filter.value)
                            .map((filter) => filter.category.name)
                            .toList();

                        var prices = state.filter.priceFilters
                            .where((filter) => filter.value)
                            .map((filter) => filter.price.price)
                            .toList();

                        List<Restaurant> restaurants = Restaurant.restaurants
                            .where(
                              (restaurant) => categories.any(
                                (category) =>
                                    restaurant.tags.contains(category),
                              ),
                            )
                            .where(
                              (restaurant) => prices.any(
                                (price) =>
                                    restaurant.priceCategory.contains(price),
                              ),
                            )
                            .toList();

                        Navigator.pushNamed(
                          context,
                          "/restaurant-listing",
                          arguments: restaurants,
                        );
                      },
                      child: Text("Apply"),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: Theme.of(context).primaryColor,
                      ),
                    );
                  } else {
                    return Text("Oops, something went wrong!");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

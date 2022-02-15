import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_application/blocs/basket/basket_bloc.dart';
import 'package:food_delivery_application/screens/widget/public_bottomAppbar.dart';
import 'package:food_delivery_application/screens/widget/public_topAppbar.dart';
// import 'package:food_delivery_application/screens/widget/public_topAppbar.dart';

class EditBasketScreen extends StatelessWidget {
  static const String routeName = "/edit-basket";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => EditBasketScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PublicTopAppBar(
        title: "Edit Basket",
        icon: Icon(CupertinoIcons.xmark_circle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Items",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              BlocBuilder<BasketBloc, BasketState>(
                builder: (context, state) {
                  if (state is BasketLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  } else if (state is BasketLoaded) {
                    return state.basket.items.length == 0
                        ? Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "No Items in the Basket",
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: state.basket
                                .itemQuantity(state.basket.items)
                                .keys
                                .length,
                            itemBuilder: (context, index) {
                              return Container(
                                color: Colors.white,
                                width: double.infinity,
                                margin: const EdgeInsets.only(top: 5.0),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0,
                                  vertical: 10.0,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      "${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value}x",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                    SizedBox(width: 20.0),
                                    Expanded(
                                      child: Text(
                                        "${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ),
                                    IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(RemoveAllItem(state.basket
                                              .itemQuantity(state.basket.items)
                                              .keys
                                              .elementAt(index)));
                                      },
                                      icon: Icon(
                                        CupertinoIcons.delete_solid,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(
                                            RemoveItem(
                                              state.basket
                                                  .itemQuantity(
                                                      state.basket.items)
                                                  .keys
                                                  .elementAt(index),
                                            ),
                                          );
                                      },
                                      icon: Icon(
                                        CupertinoIcons.minus_circle_fill,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    IconButton(
                                      visualDensity: VisualDensity.compact,
                                      onPressed: () {
                                        context.read<BasketBloc>()
                                          ..add(
                                            AddItem(
                                              state.basket
                                                  .itemQuantity(
                                                      state.basket.items)
                                                  .keys
                                                  .elementAt(index),
                                            ),
                                          );
                                      },
                                      icon: Icon(
                                        CupertinoIcons.add_circled_solid,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
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
      bottomNavigationBar: PublicBottomAppBar(
        text: "Done",
        functionApply: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

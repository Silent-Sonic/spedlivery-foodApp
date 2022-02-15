import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_application/blocs/basket/basket_bloc.dart';
import 'package:food_delivery_application/screens/widget/public_bottomAppbar.dart';
// import 'package:food_delivery_application/screens/widget/public_topAppbar.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);
  static const String routeName = "/basket";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => BasketScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/edit-basket");
            },
            icon: Icon(CupertinoIcons.pen),
          ),
        ],
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: Navigator.of(context).pop,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Basket",
          style: Theme.of(context).textTheme.headline6?.copyWith(
                fontSize: 17.5,
                color: Colors.white,
              ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cutlery",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                margin: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Do you need cutlery ?",
                        style: Theme.of(context).textTheme.headline6,
                      ),
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
                          return SizedBox(
                            width: 25,
                            child: SwitchListTile(
                              activeColor: Theme.of(context).primaryColor,
                              dense: false,
                              value: state.basket.cutlery,
                              onChanged: (bool? newValue) {
                                context.read<BasketBloc>().add(ToggleSwitch());
                              },
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
                                    Text(
                                      "\$${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).price}",
                                      style:
                                          Theme.of(context).textTheme.headline6,
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
              Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 12.5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: AssetImage("assets/image/basket_delivery.png"),
                    ),
                    BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                        if (state is BasketLoaded) {
                          return (state.basket.deliveryTime == null)
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 22.5),
                                    Text(
                                      "Please choose a delivery time",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, "/delivery-time");
                                      },
                                      child: Text(
                                        "Choose Time",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 22.5),
                                    Wrap(
                                      children: [
                                        Text(
                                          "Delivery Time at ${state.basket.deliveryTime!.value}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, "/delivery-time");
                                      },
                                      child: Text(
                                        "Change Time",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                      ),
                                    ),
                                  ],
                                );
                        } else {
                          return Text("Oops, something went wrong!");
                        }
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                        if (state is BasketLoaded) {
                          return (state.basket.voucher == null)
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 15.0),
                                    Text(
                                      "Do you have a voucher?",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, "/voucher");
                                      },
                                      child: Text(
                                        "Apply",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Your voucher is added!",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, "/voucher");
                                      },
                                      child: Text(
                                        "Change Voucher",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                      ),
                                    ),
                                  ],
                                );
                        } else {
                          return Text(
                            "Oops, something went wrong!",
                          );
                        }
                      },
                    ),
                    Image(
                      image: AssetImage("assets/image/basket_voucher.png"),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 105,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: BlocBuilder<BasketBloc, BasketState>(
                  builder: (context, state) {
                    if (state is BasketLoading) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).primaryColor,
                        ),
                      );
                    }

                    if (state is BasketLoaded) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subtotal",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                "\$${state.basket.subtotalString}",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Cutlery Fee",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                state.basket.cutlery ? "\$3.50" : "\$0.00",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery Fee",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                "\$5.00",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                              Text(
                                "\$${state.basket.totalString}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return Text("Oops, something went wrong!");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: PublicBottomAppBar(
        text: "Check Out",
        functionApply: () {},
      ),
    );
  }
}

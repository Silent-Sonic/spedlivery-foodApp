import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_application/blocs/basket/basket_bloc.dart';
import 'package:food_delivery_application/models/delivery_dayDate_model.dart';
import 'package:food_delivery_application/screens/widget/public_bottomAppbar.dart';
import 'package:food_delivery_application/screens/widget/public_topAppbar.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryTimeScreen extends StatelessWidget {
  const DeliveryTimeScreen({Key? key}) : super(key: key);
  static const String routeName = "/delivery-time";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => DeliveryTimeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PublicTopAppBar(
          title: "Delivery Time", icon: Icon(CupertinoIcons.back)),
      bottomNavigationBar: PublicBottomAppBar(
        functionApply: () {
          Navigator.of(context).pop();
        },
        text: "Select",
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Choose a Day",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context).primaryColorLight,
                          content: Text(
                            "Deliver by Today",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          duration: Duration(milliseconds: 1050),
                        ),
                      );
                    },
                    child: Text(
                      DeliveryDay.deliveryDay[0].day,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 12.5),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Theme.of(context).primaryColorLight,
                          content: Text(
                            "Deliver by Tommorow",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white),
                          ),
                          duration: Duration(milliseconds: 1050),
                        ),
                      );
                    },
                    child: Text(
                      DeliveryDay.deliveryDay[1].day,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Choose the Time",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2.5,
                  ),
                  itemCount: DeliveryTime.deliveryTimes.length,
                  itemBuilder: (context, index) {
                    return BlocBuilder<BasketBloc, BasketState>(
                      builder: (context, state) {
                        return Card(
                          child: TextButton(
                            child: Text(
                              "${DeliveryTime.deliveryTimes[index].value}",
                              style: GoogleFonts.montserrat(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            onPressed: () {
                              context.read<BasketBloc>().add(
                                    SelectDeliveryTime(
                                      DeliveryTime.deliveryTimes[index],
                                    ),
                                  );
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

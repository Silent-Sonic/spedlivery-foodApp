import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_application/blocs/basket/basket_bloc.dart';
import 'package:food_delivery_application/blocs/filters/filters_bloc.dart';
import 'package:food_delivery_application/screens/home/home_screen.dart';
import 'config/app_router.dart';
import 'config/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => FiltersBloc()
            ..add(
              FilterLoad(),
            ),
        ),
        BlocProvider(
          create: (context) => BasketBloc()
            ..add(
              StartBasket(),
            ),
        ),
      ],
      child: MaterialApp(
        title: "Spedlivery",
        theme: theme(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}

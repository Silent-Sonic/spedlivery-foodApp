import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_application/screens/widget/public_topAppbar.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  static const String routeName = "/checkout";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => CheckoutScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PublicTopAppBar(title: "Check Out", icon: Icon(CupertinoIcons.back),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
          child: Text("Home Screen"),
        ),
      ),
    );
  }
}

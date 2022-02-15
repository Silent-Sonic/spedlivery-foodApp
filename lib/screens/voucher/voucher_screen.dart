import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_application/blocs/basket/basket_bloc.dart';
import 'package:food_delivery_application/models/voucher_model.dart';
import 'package:food_delivery_application/screens/widget/public_bottomAppbar.dart';
import 'package:food_delivery_application/screens/widget/public_topAppbar.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({Key? key}) : super(key: key);
  static const String routeName = "/voucher";

  static Route route() {
    return MaterialPageRoute(
      builder: (_) => VoucherScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: PublicTopAppBar(
          title: "Voucher",
          icon: Icon(CupertinoIcons.back),
        ),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter a Voucher Code",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            hintText: "Voucher Code",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 16, color: Colors.grey.shade600),
                            contentPadding: EdgeInsets.all(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Your Vouchers",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: Voucher.vouchers.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        children: [
                          Text(
                            "1x",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(width: 20.0),
                          Expanded(
                            child: Text(
                              Voucher.vouchers[index].code,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          BlocBuilder<BasketBloc, BasketState>(
                              builder: (context, state) {
                            return TextButton(
                              onPressed: () {
                                context.read<BasketBloc>().add(
                                      AddVoucher(
                                        Voucher.vouchers[index],
                                      ),
                                    );
                              },
                              child: Text(
                                "Apply",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 13.5,
                                    ),
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: PublicBottomAppBar(
          functionApply: () {
            Navigator.of(context).pop();
          },
          text: "Apply",
        ),
      ),
    );
  }
}

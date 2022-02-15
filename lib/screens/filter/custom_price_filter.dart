import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_application/blocs/filters/filters_bloc.dart';

class CustomPriceFilter extends StatelessWidget {
  const CustomPriceFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        if (state is FiltersLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is FiltersLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: state.filter.priceFilters
                .asMap()
                .entries
                .map(
                  (price) => InkWell(
                    onTap: () {
                      context.read<FiltersBloc>().add(
                            PriceFilterUpdated(
                              priceFilter: state.filter.priceFilters[price.key]
                                  .copyWith(
                                      value: !state.filter
                                          .priceFilters[price.key].value),
                            ),
                          );
                    },
                    child: Container(
                      child: Text(
                        state.filter.priceFilters[price.key].price.price,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      decoration: BoxDecoration(
                        color: state.filter.priceFilters[price.key].value
                            ? Theme.of(context).primaryColor.withAlpha(135)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      margin: EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 10.0,
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        } else {
          return Text("Oops, something went wrong!");
        }
      },
    );
  }
}

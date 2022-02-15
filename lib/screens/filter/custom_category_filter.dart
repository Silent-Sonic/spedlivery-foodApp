import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_application/blocs/filters/filters_bloc.dart';

class CustomCategoryFilter extends StatelessWidget {
  const CustomCategoryFilter({
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
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.filter.categoryFilters.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 10.0),
                padding: EdgeInsets.symmetric(horizontal: 23.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.filter.categoryFilters[index].category.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 25,
                      child: Checkbox(
                        activeColor: Theme.of(context).primaryColor,
                        checkColor: Colors.white,
                        value: state.filter.categoryFilters[index].value,
                        onChanged: (bool? newValue) {
                          context.read<FiltersBloc>().add(
                                CategoryFilterUpdated(
                                  categoryFilter: state
                                      .filter.categoryFilters[index]
                                      .copyWith(
                                    value: !state
                                        .filter.categoryFilters[index].value,
                                  ),
                                ),
                              );
                        },
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
    );
  }
}

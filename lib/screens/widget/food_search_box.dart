import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FoodSearchBox extends StatelessWidget {
  const FoodSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "What would you like to eat ?",
                hintStyle: Theme.of(context).textTheme.headline6,
                suffixIcon: Icon(
                  CupertinoIcons.search,
                  color: Theme.of(context).primaryColor,
                ),
                contentPadding:
                    EdgeInsets.only(left: 20.0, bottom: 5.0, top: 12.5),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: IconButton(
              icon: Icon(CupertinoIcons.book),
              onPressed: () {
                Navigator.pushNamed(context, "/filters");
              },
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

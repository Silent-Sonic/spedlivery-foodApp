import 'package:flutter/material.dart';

class PublicTopAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Icon icon;

  const PublicTopAppBar({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: icon,
        onPressed: Navigator.of(context).pop,
      ),
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6?.copyWith(
              fontSize: 17.5,
              color: Colors.white,
            ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

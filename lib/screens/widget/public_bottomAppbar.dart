import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PublicBottomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String text;
  final VoidCallback functionApply;

  const PublicBottomAppBar({
    Key? key,
    required this.text,
    required this.functionApply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: functionApply,
              child: Text(
                text,
                style: GoogleFonts.montserrat(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 50,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.8),
                ),
                primary: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

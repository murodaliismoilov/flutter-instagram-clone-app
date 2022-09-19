import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          splashRadius: 1,
          splashColor: Colors.transparent,
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.squarePlus,
            color: Colors.black,
          ),
        ),
        IconButton(
          splashRadius: 1,
          splashColor: Colors.transparent,
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.message,
            color: Colors.black,
          ),
        )
      ],
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'Instagram',
        style: GoogleFonts.norican(
          textStyle: Theme.of(context).textTheme.headline4,
          color: Colors.black87,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

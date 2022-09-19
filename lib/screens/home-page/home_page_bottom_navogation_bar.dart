import 'package:flutter/material.dart';
import 'package:flutter_instagram_app/models/main_class.dart';
import 'package:provider/provider.dart';

class HomePageBottomNavigationBar extends StatefulWidget {
  const HomePageBottomNavigationBar({super.key});

  @override
  State<HomePageBottomNavigationBar> createState() =>
      _HomePageBottomNavigationBarState();
}

class _HomePageBottomNavigationBarState
    extends State<HomePageBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.add_box_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.favorite_outline),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: CircleAvatar(
              radius: 12,
              backgroundImage:
                  Image.asset(context.watch<MainClass>().myProfileImage).image,
            ),
          ),
        ],
        iconSize: 30,
        currentIndex:
            context.watch<MainClass>().bottomNavigationBarselectedIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.black,
        onTap: context.watch<MainClass>().updateScreen,
      ),
    );
  }
}

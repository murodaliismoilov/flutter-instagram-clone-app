import 'package:flutter/material.dart';
import 'package:flutter_instagram_app/screens/home-page/instagramStories.dart';
import 'package:flutter_instagram_app/screens/home-page/instagram_publication.dart';

import 'home_page.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(
        overscroll: false,
      ),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 100,
              child: InstagramStories(),
            ),
          ),
          mineDivider(),
          InstagramPublication()
        ],
      ),
    );
  }
}

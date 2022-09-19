import 'package:flutter/material.dart';
import 'package:flutter_instagram_app/screens/home-page/home_page.dart';
import 'package:flutter_instagram_app/widgets/page_view_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/instagram_history_model.dart';

class InstagramPublication extends StatefulWidget {
  const InstagramPublication({super.key});

  @override
  State<InstagramPublication> createState() => _InstagramPublicationState();
}

class _InstagramPublicationState extends State<InstagramPublication> {
  int _currentPage = 0;
  bool isCurrenPage = false;
  final pageViewController = PageController();
  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: instagramModels.length,
      itemBuilder: (context, index) {
        final width =
            instagramModels[index].imagesHistory.length > 5 ? 3.0 : 7.0;
        final height =
            instagramModels[index].imagesHistory.length > 5 ? 3.0 : 7.0;
        final imageHistoryLength = instagramModels[index].imagesHistory.length;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, right: 5, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            Image.asset(instagramModels[index].image).image,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        instagramModels[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                  IconButton(
                    splashRadius: 1,
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
            _pageViewController(index),
            Container(
              padding:
                  EdgeInsets.only(top: 11, left: 11, right: 11, bottom: 11),
              child: Column(
                children: [
                  Stack(
                    children: [
                      AllPublicationActions(),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < imageHistoryLength; i++)
                              if (_currentPage == i)
                                PageViewIndicator(
                                  isActive: true,
                                  width: 7,
                                  height: 7,
                                )
                              else
                                PageViewIndicator(
                                  isActive: false,
                                  width: width,
                                  height: height,
                                ),
                          ],
                        ),
                      ),
                      BookMarkIcon(),
                    ],
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  SizedBox _pageViewController(int index) {
    return SizedBox(
      height: 400,
      width: double.infinity,
      child: PageView.builder(
        controller: pageViewController,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: instagramModels[index].imagesHistory.length,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, i) => ListImages(
          image: instagramModels[index].imagesHistory[i],
        ),
      ),
    );
  }
}

class AllPublicationActions extends StatelessWidget {
  const AllPublicationActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PublicationActions(
          icon: Icons.favorite_outline,
        ),
        PublicationActions(
          icon: Icons.mode_comment_outlined,
        ),
        Transform.rotate(
          angle: 0.2,
          child: PublicationActions(
            icon: FontAwesomeIcons.paperPlane,
          ),
        ),
      ],
    );
  }
}

class BookMarkIcon extends StatelessWidget {
  const BookMarkIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.bookmark_outline,
          color: Colors.black,
          size: 33,
        ),
      ),
    );
  }
}

class PublicationActions extends StatelessWidget {
  const PublicationActions({
    super.key,
    required this.icon,
  });
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {},
        child: Icon(
          icon,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }
}

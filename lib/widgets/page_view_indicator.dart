import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  PageViewIndicator({
    super.key,
    required this.height,
    required this.width,
    required this.isActive,
  });
  bool isActive;
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

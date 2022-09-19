import 'package:flutter/material.dart';

final instagramHistoryGradient = BoxDecoration(
  borderRadius: BorderRadius.circular(50),
  gradient: LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.bottomRight,
    colors: const [
      Colors.yellow,
      Colors.red,
      Colors.pink,
      Colors.red,
    ],
  ),
);

final instagramHistoryWhitePading = BoxDecoration(
  borderRadius: BorderRadius.circular(50),
  color: Colors.white,
);

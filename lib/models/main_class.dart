import 'package:flutter/material.dart';

class MainClass extends ChangeNotifier {
  final String myProfileImage = 'assets/images/userImage.jpg';
  int bottomNavigationBarselectedIndex = 0;
  int get currentIndex => bottomNavigationBarselectedIndex;

  void updateScreen(int index) {
    bottomNavigationBarselectedIndex = index;
    notifyListeners();
  }
}

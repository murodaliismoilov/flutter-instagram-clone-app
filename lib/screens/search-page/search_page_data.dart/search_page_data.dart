import 'package:flutter/material.dart';
import 'package:flutter_instagram_app/screens/search-page/services/network.dart';

const String pixabayApiKey = '28649566-f450f46d906439e7407955723';

class SearchPageImageData extends ChangeNotifier {
  int counterPage = 0;
  List<String> photos = [];
  Future getImages() async {
    List<String> images = [];
    String url =
        "https://pixabay.com/api/?key=$pixabayApiKey&image_type=all&page=$counterPage&per_page=21";
    NetworkHelper newWorkHelper = NetworkHelper(url: url);
    dynamic data = await newWorkHelper.getData();
    List<dynamic> hitsLists = data["hits"] as List;
    for (int i = 0; i < hitsLists.length; i++) {
      images.add(hitsLists[i]['largeImageURL']);
    }

    images.forEach((element) {
      photos.add(element);
    });
    print(images.length);
    notifyListeners();
  }
}

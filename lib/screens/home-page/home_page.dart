import 'package:flutter/material.dart';
import 'package:flutter_instagram_app/models/main_class.dart';
import 'package:provider/provider.dart';
import '../search-page/search_page.dart';
import '../search-page/search_page_data.dart/search_page_data.dart';
import 'home_page_appbar.dart';
import 'home_page_body.dart';
import 'home_page_bottom_navogation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getImage();
  }

  getImage() async {
    context.read<SearchPageImageData>().counterPage++;
    await context.read<SearchPageImageData>().getImages();
  }

  List<Widget> widgetOptions = [
    HomePageBody(),
    SearchPageBody(),
    Text(''),
    Text(''),
    Text(''),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: HomePageBottomNavigationBar(),
      appBar: context.watch<MainClass>().bottomNavigationBarselectedIndex == 0
          ? HomePageAppBar()
          : null,
      body: widgetOptions.elementAt(context.watch<MainClass>().currentIndex),
    );
  }
}

class ListImages extends StatelessWidget {
  final String image;
  const ListImages({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: BoxFit.cover,
    );
  }
}

Container mineDivider() {
  return Container(
    color: Colors.grey,
    width: double.infinity,
    height: 0.3,
  );
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_instagram_app/screens/search-page/image-view/image_view.dart';
import 'package:flutter_instagram_app/screens/search-page/search_page_data.dart/search_page_data.dart';
import 'package:provider/provider.dart';
import 'search-text-field/search_text_field.dart';

class SearchPageBody extends StatefulWidget {
  const SearchPageBody({super.key});

  @override
  State<SearchPageBody> createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_counterImagePage);
    context.read<SearchPageImageData>().counterPage++;
  }

  @override
  Widget build(BuildContext context) {
    final list = context.watch<SearchPageImageData>().photos;
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: 1,
      ),
      child: SizedBox(
        height: size.height,
        child: ListView(
          controller: _scrollController,
          children: [
            SearchTextFIeld(size: size),
            GridView.builder(
              itemCount: context.watch<SearchPageImageData>().photos.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 1.5,
                mainAxisSpacing: 1.5,
              ),
              itemBuilder: (context, index) => SizedBox(
                width: size.width * 0.33,
                height: size.height * 0.2,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageView(
                          imageUrl: context
                              .watch<SearchPageImageData>()
                              .photos[index],
                        ),
                      ),
                    );
                  },
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        context.watch<SearchPageImageData>().photos[index],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: size.width,
              height: size.height * 0.1,
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _counterImagePage() async {
    if (_scrollController.position.atEdge) {
      final isTop = _scrollController.position.pixels == 0;
      if (isTop) {
        print('Welcome to top');
      } else {
        await context.read<SearchPageImageData>().getImages();
        await context.read<SearchPageImageData>().counterPage++;
        print(context.read<SearchPageImageData>().counterPage);
      }
    }
  }
}

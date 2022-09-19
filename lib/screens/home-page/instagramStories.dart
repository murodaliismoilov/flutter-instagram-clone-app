import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constanst/constants_for_history.dart';
import '../../models/instagram_history_model.dart';
import '../../models/main_class.dart';

class InstagramStories extends StatelessWidget {
  const InstagramStories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: instagramModels.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(
              right: 5.0,
              top: 8,
              left: 5,
            ),
            child: SizedBox(
              width: 75,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      context.watch<MainClass>().myProfileImage,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.blue,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Ваша история',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: 'Roboto',
                      color: Color(0xFF212121),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  width: 75,
                  height: 75,
                  decoration: instagramHistoryGradient,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: instagramHistoryWhitePading,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                            instagramModels[index].image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 65,
                child: Text(
                  instagramModels[index].name,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

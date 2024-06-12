import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:video_app/utils/videoList.dart';

import 'content_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ContentScreen(
                      src: videos[index],
                    ),
                  );
                },
                itemCount: videos.length,
                scrollDirection: Axis.vertical,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reels',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Icon(
                      Icons.camera_alt_outlined,
                      size: 28,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.home_filled,
            color: Colors.white,
            size: 28,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
            size: 28,
          ),
          Icon(
            Icons.add_box_outlined,
            color: Colors.white,
            size: 28,
          ),
          Icon(
            Icons.slow_motion_video_rounded,
            color: Colors.white,
            size: 28,
          ),
          Container(
            height: 28,
            width: 28,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/img/meshva.jpeg',
                    ))),
          )
        ],
      ),
    );
  }
}

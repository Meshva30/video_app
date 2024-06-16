import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/provider/Progress_Provider.dart';
import 'package:video_app/provider/like_provider.dart';
import 'package:video_app/provider/share_provider.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen(
      {super.key,
      required this.video,
      required this.username,
      required this.comment,
      required this.like,
      required this.share});

  final String video;
  final String username;
  final int comment;
  final int like;
  final String share;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 560,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img/meshva.jpeg'),
                        // child: Icon(
                        //   Icons.person,
                        //   size: 20,
                        // ),
                        radius: 18,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(username),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.verified,
                        size: 15,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 6),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Follow',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text('Love is beautiful...💓💓💓'),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.music_note,
                        size: 15,
                      ),
                      Text('Original Audio - some music track--'),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: 350,
                  ),
                  Consumer<LikeProvider>(
                    builder: (context, likeProvider, child) {
                      return GestureDetector(
                        onTap: () {
                          likeProvider.toggleLike();
                        },
                        child: Icon(
                          likeProvider.isLiked
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 30,
                          color: likeProvider.isLiked ? Colors.red : null,
                        ),
                      );
                    },
                  ),
                  Text(
                    '$like',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Icon(Icons.comment_rounded, size: 30),
                  Text('$comment'),
                  SizedBox(
                    height: 20,
                  ),
                  Transform(
                    transform: Matrix4.rotationZ(5.8),
                    child: IconButton(
                      icon: Icon(
                        Icons.send,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Provider.of<ShareProvider>(context, listen: false)
                            .shareReel(video);
                      },
                    ),
                  ),
                  Text(share),
                  SizedBox(
                    height: 20,
                  ),
                  Icon(
                    Icons.more_vert,
                    size: 30,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: AssetImage('assets/img/dil.jpg'))),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 10,),
          LinearProgressIndicator(
            minHeight: 2,
            value: Provider.of<ProgressProvider>(context).videoProgress,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ],
      ),
    );
  }
}

bool isLiked = false;

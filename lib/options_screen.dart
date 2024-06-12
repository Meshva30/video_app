import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({super.key});

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
                    height:560,
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
                      Text("Meshva_patel30"),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.verified, size: 15,color: Colors.blue,),
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
                  Icon(
                    Icons.favorite_border,
                    size: 30,
                  ),
                  Text(
                    '101K',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Icon(Icons.comment_rounded, size: 30),
                  Text('1123'),
                  SizedBox(
                    height: 20,
                  ),
                  Transform(
                    transform: Matrix4.rotationZ(5.8),
                    child: Icon(
                      Icons.send,
                      size: 30,
                    ),
                  ),
                  Text(
                    '101K',
                  ),
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
                       image: DecorationImage(image: AssetImage('assets/img/dil.jpg'))
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

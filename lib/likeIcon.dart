import 'package:flutter/material.dart';

class LikeIcon extends StatelessWidget {
  Future<int> temp() async {
    return Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: temp(),
        builder: (context, snapshot) =>
        snapshot.connectionState != ConnectionState.done
            ? Icon(Icons.favorite, size: 110,color: Colors.red,)
            : SizedBox(),
      ),
    );
  }
}
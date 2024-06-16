import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/provider/Progress_Provider.dart';
import 'package:video_app/provider/like_provider.dart';

import 'package:video_app/provider/share_provider.dart';


import 'homescreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (context) => LikeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShareProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProgressProvider(),
        ),

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

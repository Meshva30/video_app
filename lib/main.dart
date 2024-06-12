import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_app/provider/video_provider.dart';


import 'homescreen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => VideoProvider(),)
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

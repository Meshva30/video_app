import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';

class ShareProvider with ChangeNotifier {
  Future<void> shareReel(String assetPath) async {
    try {
      // Get the temporary directory path
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/video.mp4';

      // Copy the asset to the temporary directory
      final byteData = await rootBundle.load(assetPath);
      final file = File(filePath);
      await file.writeAsBytes(byteData.buffer.asUint8List());

      // Share the file
      Share.shareFiles([filePath], text: 'Check out this awesome reel!');
      notifyListeners();
    } catch (e) {
      // Handle any errors
      print('Error sharing reel: $e');
    }
  }
}

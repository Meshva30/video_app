

import 'package:flutter/material.dart';

class VideoProvider extends ChangeNotifier {
  bool _liked = false;
  bool _isMuted = false;

  bool get liked => _liked;
  bool get isMuted => _isMuted;

  void toggleLike() {
    _liked = !_liked;
    notifyListeners();
  }

  void toggleMute() {
    _isMuted = !_isMuted;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class LikeProvider with ChangeNotifier {
  bool _isLiked = false;

  bool get isLiked => _isLiked;

  void toggleLike() {
    _isLiked = !_isLiked;
    notifyListeners();
  }
}

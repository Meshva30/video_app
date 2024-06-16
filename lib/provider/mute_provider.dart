import 'package:flutter/material.dart';

class MuteProvider with ChangeNotifier {
  bool _isMuted = false;
  bool _isIconVisible = true; // Start with the icon visible

  bool get isMuted => _isMuted;
  bool get isIconVisible => _isIconVisible;

  void toggleMute() {
    _isMuted = !_isMuted;
    notifyListeners();
  }

  void toggleIconVisibility() {
    _isIconVisible = !_isIconVisible;
    notifyListeners();
  }

  void hideIcon() {
    _isIconVisible = false;
    notifyListeners();
  }
}

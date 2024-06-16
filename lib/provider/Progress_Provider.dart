import 'package:flutter/foundation.dart';

class ProgressProvider extends ChangeNotifier {
  double _videoProgress = 0.0;

  double get videoProgress => _videoProgress;

  void updateProgress(double progress) {
    _videoProgress = progress;
    notifyListeners();
  }
}

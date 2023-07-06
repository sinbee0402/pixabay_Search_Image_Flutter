import 'package:flutter/material.dart';
import 'package:search_image4/domain/use_case/get_top_five_most_viewed_images_use_case.dart';
import 'package:search_image4/presentation/main/main_state.dart';

class MainViewModel with ChangeNotifier {
  final GetTopFiveMostViewedImagesUseCase _getTopFiveMostViewedImagesUseCase;

  MainViewModel(this._getTopFiveMostViewedImagesUseCase);

  MainState _state = const MainState();
  MainState get state => _state;

  void fetch(String query) async {
    _state = state.copyWith(
      photos: await _getTopFiveMostViewedImagesUseCase(query),
    );
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:mvvm_guide/domain/repository/photo_repository.dart';
import 'package:mvvm_guide/ui/main_action.dart';
import 'package:mvvm_guide/ui/main_state.dart';

class MainViewModel extends ChangeNotifier {
  // 데이터 저장소
  final PhotoRepository _repository;

  MainViewModel({required PhotoRepository repository})
      : _repository = repository;

  MainState _state = const MainState();

  MainState get state => _state;

  void onAction(MainAction action) {
    action.when(
      fetchImages: _fetchImages,
    );
  }

  Future<void> _fetchImages(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final images = await _repository.getImages(query);
    _state = state.copyWith(
      images: images,
      isLoading: false,
    );
    notifyListeners();
  }
}

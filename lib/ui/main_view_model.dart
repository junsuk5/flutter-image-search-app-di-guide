import 'dart:collection';

import 'package:flutter/material.dart';

import '../data/model/photo.dart';
import '../data/repository/photo_repository.dart';

class MainViewModel extends ChangeNotifier {
  // 데이터 저장소
  final PhotoRepository _repository;

  MainViewModel({required PhotoRepository repository})
      : _repository = repository;

  // 데이터
  List<Photo> _images = [];

  List<Photo> get images => UnmodifiableListView(_images); // 로딩

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchImages(String query) async {
    _isLoading = true;
    notifyListeners();

    _images = await _repository.getImages(query);
    _isLoading = false;
    notifyListeners();
  }
}

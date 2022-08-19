import 'package:mvvm_guide/domain/model/photo.dart';
import 'package:mvvm_guide/domain/repository/photo_repository.dart';

import '../data_source/remote/pixabay_api.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PixabayApi _photoApi;

  PhotoRepositoryImpl({required PixabayApi photoApi}) : _photoApi = photoApi;

  @override
  Future<List<Photo>> getImages(String query) async {
    final jsonArray = await _photoApi.getImages(query);
    return jsonArray.map((e) => Photo.fromJson(e)).toList();
  }
}

import '../data_source/remote/pixabay_api.dart';
import '../model/photo.dart';

class PhotoRepository {
  final PixabayApi _photoApi;

  PhotoRepository({required PixabayApi photoApi}) : _photoApi = photoApi;

  Future<List<Photo>> getImages(String query) async {
    final jsonArray = await _photoApi.getImages(query);
    return jsonArray.map((e) => Photo.fromJson(e)).toList();
  }
}

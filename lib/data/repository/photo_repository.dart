import 'dart:convert';

import '../data_source/remote/pixabay_api.dart';
import '../model/photo.dart';

class PhotoRepository {
  final PixabayApi _photoApi;

  PhotoRepository({required PixabayApi photoApi}) : _photoApi = photoApi;

  Future<List<Photo>> getImages(String query) async {
    final response = await _photoApi.getImages(query);

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    List<dynamic> hits = json['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}

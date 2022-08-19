import 'package:mvvm_guide/domain/model/photo.dart';

abstract class PhotoRepository {
  Future<List<Photo>> getImages(String query);
}

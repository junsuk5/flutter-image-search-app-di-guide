import 'package:injectable/injectable.dart';

import '../data/data_source/remote/pixabay_api.dart';
import '../data/repository/photo_repository.dart';
import 'di_setup.dart';

@module
abstract class RepositoryModule {
  @injectable
  PhotoRepository get photoRepository =>
      PhotoRepository(photoApi: getIt<PixabayApi>());
}

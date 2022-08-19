import 'package:injectable/injectable.dart';

import '../data/data_source/remote/pixabay_api.dart';
import '../data/repository/photo_repository_impl.dart';
import 'di_setup.dart';

@module
abstract class RepositoryModule {
  @injectable
  PhotoRepositoryImpl get photoRepository =>
      PhotoRepositoryImpl(photoApi: getIt<PixabayApi>());
}

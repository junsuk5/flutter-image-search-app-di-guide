import 'package:injectable/injectable.dart';

import '../data/data_source/remote/pixabay_api.dart';

@module
abstract class AppModule {
  @singleton
  PixabayApi get pixabayApi => PixabayApi();
}

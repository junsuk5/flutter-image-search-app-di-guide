import 'package:injectable/injectable.dart';

import '../data/repository/photo_repository_impl.dart';
import '../ui/main_view_model.dart';
import 'di_setup.dart';

@module
abstract class ViewModelModule {
  @injectable
  MainViewModel get mainViewModel =>
      MainViewModel(repository: getIt<PhotoRepositoryImpl>());
}

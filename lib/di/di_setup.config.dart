// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/data_source/remote/pixabay_api.dart' as _i5;
import '../data/repository/photo_repository.dart' as _i4;
import '../ui/main_view_model.dart' as _i3;
import 'app_module.dart' as _i8;
import 'repository_module.dart' as _i7;
import 'view_model_module.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final viewModelModule = _$ViewModelModule();
  final repositoryModule = _$RepositoryModule();
  final appModule = _$AppModule();
  gh.factory<_i3.MainViewModel>(() => viewModelModule.mainViewModel);
  gh.factory<_i4.PhotoRepository>(() => repositoryModule.photoRepository);
  gh.singleton<_i5.PixabayApi>(appModule.pixabayApi);
  return get;
}

class _$ViewModelModule extends _i6.ViewModelModule {}

class _$RepositoryModule extends _i7.RepositoryModule {}

class _$AppModule extends _i8.AppModule {}

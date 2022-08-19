import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mvvm_guide/domain/model/photo.dart';

part 'main_state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default([]) List<Photo> images,
    @Default(false) bool isLoading,
  }) = _MainState;

}
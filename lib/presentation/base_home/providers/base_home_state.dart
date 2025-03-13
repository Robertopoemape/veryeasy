import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_home_state.freezed.dart';

@freezed
class BaseHomeState with _$BaseHomeState {
  const factory BaseHomeState({
    required int currentIndex,
  }) = _BaseHomeState;
}

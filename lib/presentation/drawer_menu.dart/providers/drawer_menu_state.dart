import 'package:freezed_annotation/freezed_annotation.dart';

part 'drawer_menu_state.freezed.dart';
part 'drawer_menu_state.g.dart';

@freezed
class DrawerMenuState with _$DrawerMenuState {
  const factory DrawerMenuState({
    @Default(false) bool isLoading,
  }) = _DrawerMenuState;

  factory DrawerMenuState.fromJson(Map<String, dynamic> json) =>
      _$DrawerMenuStateFromJson(json);
}

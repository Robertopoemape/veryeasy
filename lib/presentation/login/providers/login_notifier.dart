import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:veryeasy/core/global_provider/login_provider.dart';
import 'package:veryeasy/core/router/router_provider.gr.dart';

import '../../../src/entities/profile_user.dart';
import '../../../src/services/auth/auth_service.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  ProfileUser? build() => ref.watch(authServiceProvider).currentUser;

  void setUser(ProfileUser? user) => state = user;

  Future<void> signIn(
      String email, String password, BuildContext context) async {
    if (email.trim().isEmpty || password.trim().isEmpty) {
      _showSnackBar(context, 'Ingrese credenciales válidas', Colors.orange);
      return;
    }

    final authRepository = ref.read(authRepositoryProvider);
    final result = await authRepository.signIn(email, password);

    result.fold(
      (failure) => _showSnackBar(
          context, failure.message ?? 'Error desconocido', Colors.red),
      (user) async {
        if (user != null && context.mounted) {
          setUser(user);
          context.replaceRoute(HomeRoute());
        }
      },
    );
  }

  Future<void> signInWithGoogle() async =>
      setUser(await ref.read(authServiceProvider).signInWithGoogle());

  Future<void> signOut() async {
    await ref.read(authServiceProvider).signOut();
    setUser(null);
  }

  Future<void> signUp(String email, String password) async =>
      setUser(await ref.read(authServiceProvider).signUp(email, password));

  void _showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
  }
}

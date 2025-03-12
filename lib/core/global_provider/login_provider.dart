import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../src/repositories/auth/remote/auth_repository.dart';
import '../../../src/services/auth/auth_service.dart';

part 'login_provider.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  final authService = ref.read(authServiceProvider);
  return AuthRepositoryImpl(authService);
}

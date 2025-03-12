import 'package:veryeasy/core/exceptions/failure.dart';
import 'package:veryeasy/core/utils/methods/either.dart';
import 'package:veryeasy/src/entities/profile_user.dart';

import '../../../../core/decorator/decorator_firebase.dart';
import '../../../services/auth/auth_service.dart';

abstract class AuthRepository {
  Future<Either<Failure, ProfileUser?>> signUp(String email, String password);
  Future<Either<Failure, ProfileUser?>> signIn(String email, String password);
  Future<Either<Failure, ProfileUser?>> signInWithGoogle();
  Future<Either<Failure, void>> signOut();
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<Either<Failure, ProfileUser?>> signUp(String email, String password) =>
      firebaseFutureDecorator(
        () => _authService.signUp(email, password),
      );

  @override
  Future<Either<Failure, ProfileUser?>> signIn(String email, String password) =>
      firebaseFutureDecorator(
        () => _authService.signIn(email, password),
      );

  @override
  Future<Either<Failure, ProfileUser?>> signInWithGoogle() =>
      firebaseFutureDecorator(
        _authService.signInWithGoogle,
      );

  @override
  Future<Either<Failure, void>> signOut() => firebaseFutureDecorator(
        _authService.signOut,
      );
}

import 'package:veryeasy/core/exceptions/failure.dart';
import 'package:veryeasy/core/utils/methods/either.dart';
import 'package:veryeasy/src/entities/profile_user.dart';

import '../../repositories/auth/remote/auth_repository.dart';

class SignIn {
  final AuthRepository authRepository;

  SignIn(this.authRepository);

  Future<Either<Failure, ProfileUser?>> call(String email, String password) {
    return authRepository.signIn(email, password);
  }
}

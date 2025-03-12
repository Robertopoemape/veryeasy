import 'package:veryeasy/core/exceptions/failure.dart';
import 'package:veryeasy/core/utils/methods/either.dart';

import '../../repositories/auth/remote/auth_repository.dart';

class SignOut {
  final AuthRepository authRepository;

  SignOut(this.authRepository);

  Future<Either<Failure, void>> call() {
    return authRepository.signOut();
  }
}

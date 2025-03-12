import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:veryeasy/core/exceptions/exceptions.dart';
import 'package:veryeasy/core/utils/methods/either.dart';

Future<Either<Failure, T>> firebaseFutureDecorator<T>(
  Future<T> Function() callback,
) async {
  try {
    final result = await callback();
    return Either<Failure, T>.right(result);
  } on FirebaseAuthException catch (e) {
    return Either<Failure, T>.left(_mapFirebaseAuthExceptionToFailure(e));
  } on FirebaseException catch (e) {
    return Either<Failure, T>.left(_mapFirebaseExceptionToFailure(e));
  } on CException catch (e) {
    final err = e;

    return Either<Failure, T>.left(
      err.when(
        cacheException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            CacheFailure(message: message),
        conflictException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            ConflictFailure(message: message),
        connectTimeOutException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            ConnectionTimeoutFailure(message: message),
        parametersException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            ErrorParametersFailure(message: message),
        internalServerErrorException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            InternalServerErrorFailure(message: message),
        invalidCredentialsException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            InvalidCredentialFailure(message: message),
        localException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            LocalFailure(message: message),
        networkConnectionException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            NetworkConnectionFailure(message: message),
        notFoundException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            NotFoundFailure(message: message),
        othersException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            OthersFailure(message: message),
        parserErrorException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            ParserErrorFailure(message: message),
        requestTimeOutException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            RequestTimeOutFailure(message: message),
        serverCancelException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            ServerCancelFailure(message: message),
        serverSocketException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            ServerSocketFailure(message: message),
        serviceUnAvailableException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            ServiceUnAvailableFailure(message: message),
        sessionExpiredException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            SessionExpiredFailure(message: message),
        sessionNotFoundException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            SessionNotFoundFailure(message: message),
        undefinedException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            UndefinedFailure(message: message),
        undefinedOrUrlNotExistException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            UndefinedOrUrlNotExistFailure(message: message),
        registerInvalidException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            RegisterInvalidFailure(message: message),
        emptyDataException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            EmptyDataFailure(message: message),
        businessErrorException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            BusinessErrorFailure(message: message),
        firebaseNetworkException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            FirebaseNetworkFailure(message: message),
        firebaseTooManyRequestsException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            FirebaseTooManyRequestsFailure(message: message),
        firebaseInvalidUserException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            FirebaseInvalidUserFailure(message: message),
        firebaseUserDisabledException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            FirebaseUserDisabledFailure(message: message),
        firebaseUserNotFoundException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            FirebaseUserNotFoundFailure(message: message),
        firebaseUserCollisionException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            FirebaseUserCollisionFailure(message: message),
        firebaseCredentialAlreadyInUseException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            FirebaseCredentialAlreadyInUseFailure(message: message),
        firebaseWeakPasswordException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            FirebaseWeakPasswordFailure(message: message),
        firebaseExpiredActionCodeException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            FirebaseExpiredActionCodeFailure(message: message),
        firebaseInvalidActionCodeException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            FirebaseInvalidActionCodeFailure(message: message),
        firebaseInvalidCredentialException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            FirebaseInvalidCredentialFailure(message: message),
        firebaseOperationNotAllowedException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            FirebaseOperationNotAllowedFailure(message: message),
        firebaseAuthRecentLoginRequiredException: (
          String? message,
          StackTrace? stackTrace,
          dynamic error,
          bool? report,
        ) =>
            FirebaseAuthRecentLoginRequiredFailure(message: message),
      ),
    );
  } catch (e) {
    return Either<Failure, T>.left(OthersFailure(message: e.toString()));
  }
}

Failure _mapFirebaseAuthExceptionToFailure(FirebaseAuthException e) {
  switch (e.code) {
    case 'channel-error':
      return FirebaseInvalidCredentialFailure(
          message: 'Error en inicio de sesión');
    case 'invalid-email':
      return FirebaseInvalidCredentialFailure(
          message: 'La dirección de correo electrónico está mal formateada');
    case 'invalid-credential':
      return FirebaseInvalidCredentialFailure(
          message:
              'La credencial de autenticación proporcionada es incorrecta, está mal formada o ha expirado.');
    case 'user-disabled':
      return FirebaseUserDisabledFailure(message: e.message);
    case 'user-not-found':
      return FirebaseUserNotFoundFailure(message: e.message);
    case 'wrong-password':
      return FirebaseInvalidCredentialFailure(message: e.message);
    case 'email-already-in-use':
      return FirebaseUserCollisionFailure(message: e.message);
    case 'credential-already-in-use':
      return FirebaseCredentialAlreadyInUseFailure(message: e.message);
    case 'weak-password':
      return FirebaseWeakPasswordFailure(message: e.message);
    case 'too-many-requests':
      return FirebaseTooManyRequestsFailure(message: e.message);
    case 'operation-not-allowed':
      return FirebaseOperationNotAllowedFailure(message: e.message);
    default:
      return FirebaseInvalidUserFailure(message: e.message);
  }
}

Failure _mapFirebaseExceptionToFailure(FirebaseException e) {
  final message = e.message ?? 'An undefined error occurred.';
  if (message.contains('The service is currently unavailable')) {
    return FirebaseNetworkFailure(message: message);
  } else if (message.contains('The request has timed out')) {
    return FirebaseNetworkFailure(message: message);
  } else {
    return FirebaseInvalidUserFailure(message: message);
  }
}

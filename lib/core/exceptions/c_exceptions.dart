import 'package:freezed_annotation/freezed_annotation.dart';

part 'c_exceptions.freezed.dart';

@freezed
class CException with _$CException {
  @Implements<Exception>()
  const factory CException.cacheException({
    @Default('cacheException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = CacheException;
  @Implements<Exception>()
  const factory CException.conflictException({
    @Default('conflictException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = ConflictException;
  @Implements<Exception>()
  const factory CException.connectTimeOutException({
    @Default('connectTimeOutException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = ConnectTimeOutException;
  @Implements<Exception>()
  const factory CException.parametersException({
    @Default('parametersException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = ParametersException;
  @Implements<Exception>()
  const factory CException.internalServerErrorException({
    @Default('internalServerErrorException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = InternalServerErrorException;
  @Implements<Exception>()
  const factory CException.invalidCredentialsException({
    @Default('invalidCredentialsException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = InvalidCredentialsException;
  @Implements<Exception>()
  const factory CException.localException({
    @Default('localException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = LocalException;
  @Implements<Exception>()
  const factory CException.networkConnectionException({
    @Default('networkConnectionException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = NetworkConnectionException;
  @Implements<Exception>()
  const factory CException.notFoundException({
    @Default('notFoundException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = NotFoundException;
  @Implements<Exception>()
  const factory CException.othersException({
    @Default('othersException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = OthersException;
  @Implements<Exception>()
  const factory CException.parserErrorException({
    @Default('parserErrorException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = ParserErrorException;
  @Implements<Exception>()
  const factory CException.requestTimeOutException({
    @Default('requestTimeOutException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = RequestTimeOutException;
  @Implements<Exception>()
  const factory CException.serverCancelException({
    @Default('serverCancelException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = ServerCancelException;
  @Implements<Exception>()
  const factory CException.serverSocketException({
    @Default('serverSocketException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = ServerSocketException;
  @Implements<Exception>()
  const factory CException.serviceUnAvailableException({
    @Default('serviceUnAvailableException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = ServiceUnAvailableException;
  @Implements<Exception>()
  const factory CException.sessionExpiredException({
    @Default('sessionExpiredException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = SessionExpiredException;
  @Implements<Exception>()
  const factory CException.sessionNotFoundException({
    @Default('sessionNotFoundException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = SessionNotFoundException;
  @Implements<Exception>()
  const factory CException.undefinedException({
    @Default('undefinedException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = UndefinedException;
  @Implements<Exception>()
  const factory CException.undefinedOrUrlNotExistException({
    @Default('undefinedOrUrlNotExistException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = UndefinedOrUrlNotExistException;
  @Implements<Exception>()
  const factory CException.registerInvalidException({
    @Default('registerInvalidException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = RegisterInvalidException;
  @Implements<Exception>()
  const factory CException.emptyDataException({
    @Default('emptyDataException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = EmptyDataException;
  @Implements<Exception>()
  const factory CException.businessErrorException({
    @Default('businessErrorException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = BusinessErrorException;
  @Implements<Exception>()
  const factory CException.firebaseNetworkException({
    @Default('firebaseNetworkException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = FirebaseNetworkException;
  @Implements<Exception>()
  const factory CException.firebaseTooManyRequestsException({
    @Default('firebaseTooManyRequestsException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = FirebaseTooManyRequestsException;
  @Implements<Exception>()
  const factory CException.firebaseInvalidUserException({
    @Default('firebaseInvalidUserException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = FirebaseInvalidUserException;
  @Implements<Exception>()
  const factory CException.firebaseUserDisabledException({
    @Default('firebaseUserDisabledException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = FirebaseUserDisabledException;
  @Implements<Exception>()
  const factory CException.firebaseUserNotFoundException({
    @Default('firebaseUserNotFoundException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = FirebaseUserNotFoundException;
  @Implements<Exception>()
  const factory CException.firebaseUserCollisionException({
    @Default('firebaseUserCollisionException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = FirebaseUserCollisionException;
  @Implements<Exception>()
  const factory CException.firebaseAuthRecentLoginRequiredException({
    @Default('firebaseAuthRecentLoginRequiredException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = FirebaseAuthRecentLoginRequiredException;
  @Implements<Exception>()
  const factory CException.firebaseCredentialAlreadyInUseException({
    @Default('firebaseCredentialAlreadyInUseException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = FirebaseCredentialAlreadyInUseException;
  @Implements<Exception>()
  const factory CException.firebaseWeakPasswordException({
    @Default('firebaseWeakPasswordException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = FirebaseWeakPasswordException;
  @Implements<Exception>()
  const factory CException.firebaseExpiredActionCodeException({
    @Default('firebaseExpiredActionCodeException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = FirebaseExpiredActionCodeException;
  @Implements<Exception>()
  const factory CException.firebaseInvalidActionCodeException({
    @Default('firebaseInvalidActionCodeException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = FirebaseInvalidActionCodeException;
  @Implements<Exception>()
  const factory CException.firebaseInvalidCredentialException({
    @Default('firebaseInvalidCredentialException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = FirebaseInvalidCredentialException;
  @Implements<Exception>()
  const factory CException.firebaseOperationNotAllowedException({
    @Default('firebaseOperationNotAllowedException') String? message,
    StackTrace? stackTrace,
    dynamic error,
    @Default(true) bool? report,
  }) = FirebaseOperationNotAllowedException;
}

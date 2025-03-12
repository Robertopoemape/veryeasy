import 'package:freezed_annotation/freezed_annotation.dart';

part 'either.freezed.dart';

@freezed
class Either<L, R> with _$Either<L, R> {
  const Either._(); // Constructor privado para métodos adicionales

  const factory Either.left(L left) = Left<L, R>;
  const factory Either.right(R right) = Right<L, R>;

  // Agregar el método `fold`
  T fold<T>(T Function(L l) leftFn, T Function(R r) rightFn) {
    return when(
      left: leftFn,
      right: rightFn,
    );
  }
}

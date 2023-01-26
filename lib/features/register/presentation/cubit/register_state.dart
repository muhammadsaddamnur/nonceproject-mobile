part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = Initial;
  const factory RegisterState.success({
    GenerateEntity? generateEntity,
  }) = Success;
  const factory RegisterState.saved() = Saved;
}

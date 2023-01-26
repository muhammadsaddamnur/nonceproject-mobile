part of 'transfer_cubit.dart';

@freezed
class TransferState with _$TransferState {
  const factory TransferState.initial() = Initial;
  const factory TransferState.success({
    String? tx,
  }) = Success;
}

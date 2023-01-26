import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:nonceproject_mobile/features/transfer/domain/usecases/transfer.dart';

import '../../../../core/di/service_locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../dashboard/data/datasources/dashboard_data_source.dart';

part 'transfer_state.dart';
part 'transfer_cubit.freezed.dart';

@injectable
class TransferCubit extends Cubit<TransferState> {
  TransferCubit() : super(const Initial());

  void transfer({
    required String to,
    required double amount,
    required Coin coin,
  }) async {
    String? tx = (await getIt<Transfer>()
            .call(Params(to: to, amount: amount, coin: coin)))
        .fold(
      (l) => null,
      (r) => r,
    );
    if (tx == null) return;
    log(tx.toString());
    emit(Success(tx: tx));
  }
}

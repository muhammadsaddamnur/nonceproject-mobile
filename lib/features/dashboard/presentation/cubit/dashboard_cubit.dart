import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nonceproject_mobile/features/dashboard/data/datasources/dashboard_data_source.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_balance.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.dart';
part 'dashboard_cubit.freezed.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const Success());

  void getBalanceCoin({required Coin coin}) async {
    double? balance = (await getIt<GetBalance>().call(Params(coin: coin))).fold(
      (l) => null,
      (r) => r,
    );
    if (balance == null) return;
    log(balance.toString());

    switch (coin) {
      case Coin.native:
        state.mapOrNull(
          success: (value) {
            emit(value.copyWith(native: balance));
          },
        );

        break;
      case Coin.usdc:
        state.mapOrNull(
          success: (value) {
            emit(value.copyWith(usdc: balance));
          },
        );
        break;
      default:
    }
  }
}

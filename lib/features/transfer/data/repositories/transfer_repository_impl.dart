import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:nonceproject_mobile/core/di/service_locator.dart';
import 'package:nonceproject_mobile/features/dashboard/data/datasources/dashboard_data_source.dart';
import 'package:nonceproject_mobile/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:nonceproject_mobile/features/transfer/data/datasources/transfer_data_source.dart';
import 'package:nonceproject_mobile/features/transfer/domain/repositories/transfer_repository.dart';

@LazySingleton(as: TransferRepository)
class TransferRepositoryImpl implements TransferRepository {
  @override
  Future<Either<Failure, String>> transfer({
    required String to,
    required double amount,
    required Coin coin,
  }) async {
    final TransferDataSource dataSource = getIt();
    try {
      return Right(
          await dataSource.transfer(to: to, amount: amount, coin: coin));
    } catch (e) {
      log(e.toString());
      return Left(Failure());
    }
  }
}

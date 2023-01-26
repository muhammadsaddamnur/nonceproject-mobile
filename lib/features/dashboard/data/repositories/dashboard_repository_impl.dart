import 'package:injectable/injectable.dart';
import 'package:nonceproject_mobile/features/dashboard/data/datasources/dashboard_data_source.dart';
import 'package:nonceproject_mobile/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:nonceproject_mobile/features/dashboard/domain/repositories/dashboard_repository.dart';

import '../../../../core/di/service_locator.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  @override
  Future<Either<Failure, double>> getBalance(Coin coin) async {
    final DashboardDataSource dataSource = getIt();
    try {
      return Right(await dataSource.getBalance(coin: coin));
    } catch (e) {
      return Left(Failure());
    }
  }
}

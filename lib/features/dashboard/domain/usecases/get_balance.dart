import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nonceproject_mobile/features/dashboard/data/datasources/dashboard_data_source.dart';
import 'package:nonceproject_mobile/features/dashboard/domain/repositories/dashboard_repository.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/usecase.dart';

@LazySingleton()
class GetBalance extends UseCase<double, Params, DashboardRepository> {
  @override
  Future<Either<Failure, double>> call(Params params) =>
      repo.getBalance(params.coin);

  @override
  DashboardRepository get repo => getIt<DashboardRepository>();
}

class Params {
  final Coin coin;

  Params({required this.coin});
}

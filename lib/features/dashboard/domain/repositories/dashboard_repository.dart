import 'package:dartz/dartz.dart';
import 'package:nonceproject_mobile/core/failure/failure.dart';
import 'package:nonceproject_mobile/features/dashboard/data/datasources/dashboard_data_source.dart';

abstract class DashboardRepository {
  Future<Either<Failure, double>> getBalance(Coin coin);
}

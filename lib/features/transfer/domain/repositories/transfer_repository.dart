import 'package:dartz/dartz.dart';
import 'package:nonceproject_mobile/core/failure/failure.dart';

import '../../../dashboard/data/datasources/dashboard_data_source.dart';

abstract class TransferRepository {
  Future<Either<Failure, String>> transfer({
    required String to,
    required double amount,
    required Coin coin,
  });
}

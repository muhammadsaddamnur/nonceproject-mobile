import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nonceproject_mobile/features/transfer/domain/repositories/transfer_repository.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../dashboard/data/datasources/dashboard_data_source.dart';

@LazySingleton()
class Transfer extends UseCase<String, Params, TransferRepository> {
  @override
  Future<Either<Failure, String>> call(Params params) =>
      repo.transfer(to: params.to, amount: params.amount, coin: params.coin);

  @override
  TransferRepository get repo => getIt<TransferRepository>();
}

class Params {
  final String to;
  final double amount;
  final Coin coin;

  Params({required this.to, required this.amount, required this.coin});
}

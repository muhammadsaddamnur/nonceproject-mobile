import 'package:injectable/injectable.dart';
import 'package:nonceproject_mobile/core/di/service_locator.dart';
import 'package:nonceproject_mobile/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:nonceproject_mobile/features/register/data/datasources/register_data_source.dart';
import 'package:nonceproject_mobile/features/register/domain/repositories/generate_repository.dart';

import '../../domain/entities/generate_entity.dart';

@LazySingleton(as: GenerateRepository)
class GenerateRepositoryImpl extends GenerateRepository {
  final RegisterDataSource dataSource = getIt();
  @override
  Future<Either<Failure, GenerateEntity>> generateFromMnemonic() async {
    try {
      return Right(dataSource.generateFromMnemonic());
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, GenerateEntity>> generateFromRandom() async {
    try {
      return Right(dataSource.generateFromRandom());
    } catch (e) {
      return Left(Failure());
    }
  }
}

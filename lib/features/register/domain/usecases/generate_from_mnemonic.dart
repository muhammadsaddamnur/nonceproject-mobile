import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:nonceproject_mobile/features/register/domain/entities/generate_entity.dart';
import 'package:nonceproject_mobile/features/register/domain/repositories/generate_repository.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/usecase.dart';

@LazySingleton()
class GenerateFromMenemonic
    extends UseCase<GenerateEntity, NoParams, GenerateRepository> {
  @override
  Future<Either<Failure, GenerateEntity>> call(NoParams params) =>
      repo.generateFromMnemonic();

  @override
  GenerateRepository get repo => getIt<GenerateRepository>();
}

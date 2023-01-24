import 'package:dartz/dartz.dart';
import 'package:nonceproject_mobile/features/register/domain/entities/generate_entity.dart';
import '../../../../core/failure/failure.dart';
import '';

abstract class GenerateRepository {
  Future<Either<Failure, GenerateEntity>> generateFromMnemonic();
  Future<Either<Failure, GenerateEntity>> generateFromRandom();
}

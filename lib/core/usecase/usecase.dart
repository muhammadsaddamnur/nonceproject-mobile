import 'package:dartz/dartz.dart';

import '../failure/failure.dart';

abstract class UseCase<T, P, R> {
  R get repo;

  Future<Either<Failure, T>> call(P params);
}

class NoParams {}

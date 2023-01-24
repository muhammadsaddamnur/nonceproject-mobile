// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nonceproject_mobile/features/register/data/datasources/register_data_source.dart'
    as _i6;
import 'package:nonceproject_mobile/features/register/data/repositories/generate_repository_impl.dart'
    as _i5;
import 'package:nonceproject_mobile/features/register/domain/repositories/generate_repository.dart'
    as _i4;
import 'package:nonceproject_mobile/features/register/domain/usecases/generate_from_mnemonic.dart'
    as _i3;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of main-scope dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.GenerateFromMenemonic>(
      () => _i3.GenerateFromMenemonic());
  gh.lazySingleton<_i4.GenerateRepository>(() => _i5.GenerateRepositoryImpl());
  gh.lazySingleton<_i6.RegisterDataSource>(() => _i6.RegisterDataSourceImpl());
  return getIt;
}

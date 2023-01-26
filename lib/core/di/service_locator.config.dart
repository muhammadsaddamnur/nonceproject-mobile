// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:nonceproject_mobile/core/wallet/vault.dart' as _i19;
import 'package:nonceproject_mobile/features/dashboard/data/datasources/dashboard_data_source.dart'
    as _i4;
import 'package:nonceproject_mobile/features/dashboard/data/repositories/dashboard_repository_impl.dart'
    as _i6;
import 'package:nonceproject_mobile/features/dashboard/domain/repositories/dashboard_repository.dart'
    as _i5;
import 'package:nonceproject_mobile/features/dashboard/domain/usecases/get_balance.dart'
    as _i11;
import 'package:nonceproject_mobile/features/dashboard/presentation/cubit/dashboard_cubit.dart'
    as _i3;
import 'package:nonceproject_mobile/features/register/data/datasources/register_data_source.dart'
    as _i13;
import 'package:nonceproject_mobile/features/register/data/repositories/generate_repository_impl.dart'
    as _i10;
import 'package:nonceproject_mobile/features/register/domain/repositories/generate_repository.dart'
    as _i9;
import 'package:nonceproject_mobile/features/register/domain/usecases/generate_from_mnemonic.dart'
    as _i7;
import 'package:nonceproject_mobile/features/register/domain/usecases/generate_from_random.dart'
    as _i8;
import 'package:nonceproject_mobile/features/register/presentation/cubit/register_cubit.dart'
    as _i12;
import 'package:nonceproject_mobile/features/transfer/data/datasources/transfer_data_source.dart'
    as _i16;
import 'package:nonceproject_mobile/features/transfer/data/repositories/transfer_repository_impl.dart'
    as _i18;
import 'package:nonceproject_mobile/features/transfer/domain/repositories/transfer_repository.dart'
    as _i17;
import 'package:nonceproject_mobile/features/transfer/domain/usecases/transfer.dart'
    as _i14;
import 'package:nonceproject_mobile/features/transfer/presentation/cubit/transfer_cubit.dart'
    as _i15;

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
  gh.factory<_i3.DashboardCubit>(() => _i3.DashboardCubit());
  gh.lazySingleton<_i4.DashboardDataSource>(
      () => _i4.DashboardDataSourceImpl());
  gh.lazySingleton<_i5.DashboardRepository>(
      () => _i6.DashboardRepositoryImpl());
  gh.lazySingleton<_i7.GenerateFromMnemonic>(() => _i7.GenerateFromMnemonic());
  gh.lazySingleton<_i8.GenerateFromRandom>(() => _i8.GenerateFromRandom());
  gh.lazySingleton<_i9.GenerateRepository>(() => _i10.GenerateRepositoryImpl());
  gh.lazySingleton<_i11.GetBalance>(() => _i11.GetBalance());
  gh.factory<_i12.RegisterCubit>(() => _i12.RegisterCubit());
  gh.lazySingleton<_i13.RegisterDataSource>(
      () => _i13.RegisterDataSourceImpl());
  gh.lazySingleton<_i14.Transfer>(() => _i14.Transfer());
  gh.factory<_i15.TransferCubit>(() => _i15.TransferCubit());
  gh.lazySingleton<_i16.TransferDataSource>(
      () => _i16.TransferDataSourceImpl());
  gh.lazySingleton<_i17.TransferRepository>(
      () => _i18.TransferRepositoryImpl());
  gh.lazySingleton<_i19.Vault>(() => _i19.VaultImpl());
  return getIt;
}

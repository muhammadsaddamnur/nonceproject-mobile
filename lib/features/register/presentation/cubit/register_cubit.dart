import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:nonceproject_mobile/core/di/service_locator.dart';
import 'package:nonceproject_mobile/core/usecase/usecase.dart';
import 'package:nonceproject_mobile/features/register/domain/entities/generate_entity.dart';
import 'package:nonceproject_mobile/features/register/domain/usecases/generate_from_mnemonic.dart';

import '../../../../core/wallet/vault.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.dart';
part 'register_cubit.freezed.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const Initial());

  void generate() async {
    GenerateEntity? generateEntity =
        (await getIt<GenerateFromMnemonic>().call(NoParams())).fold(
      (l) => null,
      (r) => r,
    );
    if (generateEntity == null) return;

    emit(Success(generateEntity: generateEntity));
  }

  void storeVault(GenerateEntity generateEntity) async {
    Vault vault = getIt<Vault>();
    var res = await vault.storePrivateKey(value: generateEntity.privateKey);
    log('create vault : $res');
    var get = await vault.getPrivateKey();
    log('get vault : $get');
    if (res) emit(const Saved());
  }
}

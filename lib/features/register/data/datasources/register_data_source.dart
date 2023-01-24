import 'dart:math';

import 'package:bip39_mnemonic/bip39_mnemonic.dart';
import 'package:injectable/injectable.dart';
import 'package:nonceproject_mobile/features/register/domain/entities/generate_entity.dart';
import 'package:convert/convert.dart';
import 'package:web3dart/web3dart.dart';

abstract class RegisterDataSource {
  GenerateEntity generateFromRandom();
  GenerateEntity generateFromMnemonic();
}

@LazySingleton(as: RegisterDataSource)
class RegisterDataSourceImpl implements RegisterDataSource {
  @override
  GenerateEntity generateFromMnemonic() {
    var mnemonic = Mnemonic.generate(
      Language.english,
      passphrase: "",
      entropyLength: 256,
    );

    return GenerateEntity(
      sentence: mnemonic.sentence,
      privateKey: hex.encode(mnemonic.seed),
    );
  }

  @override
  GenerateEntity generateFromRandom() {
    var rng = Random.secure();
    EthPrivateKey random = EthPrivateKey.createRandom(rng);

    return GenerateEntity(
      sentence: '',
      privateKey: hex.encode(random.privateKey),
    );
  }
}

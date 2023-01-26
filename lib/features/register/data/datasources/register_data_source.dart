import 'dart:math';

import 'package:bip39_mnemonic/bip39_mnemonic.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:nonceproject_mobile/features/register/domain/entities/generate_entity.dart';
import 'package:convert/convert.dart';
import 'package:web3dart/web3dart.dart';
import 'package:bip32/bip32.dart' as bip32;

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

    final root = bip32.BIP32.fromSeed(Uint8List.fromList(mnemonic.seed));
    String hdPath = "m/44'/60'/0'/0";
    const first = 0;
    final firstChild = root.derivePath("$hdPath/$first");

    return GenerateEntity(
      sentence: mnemonic.sentence,
      privateKey: hex.encode(firstChild.privateKey as List<int>),
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

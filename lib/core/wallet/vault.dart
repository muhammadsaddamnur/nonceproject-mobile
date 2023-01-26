import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:pointycastle/digests/sha256.dart';

abstract class Vault {
  Future<bool> storePrivateKey({required String value});
  Future<String?> getPrivateKey();
}

@LazySingleton(as: Vault)
class VaultImpl implements Vault {
  Uint8List hiveKey =
      SHA256Digest().process(Uint8List.fromList('sbHiveAes'.codeUnits));

  @override
  Future<bool> storePrivateKey({required String value}) async {
    try {
      var hiveBox = await Hive.openBox(
        'vault',
        encryptionCipher: HiveAesCipher(hiveKey),
      );
      await hiveBox.put('pk', value);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String?> getPrivateKey() async {
    try {
      var hiveBox = await Hive.openBox(
        'vault',
        encryptionCipher: HiveAesCipher(hiveKey),
      );
      return await hiveBox.get('pk');
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}

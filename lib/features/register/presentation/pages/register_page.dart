import 'dart:developer';

import 'package:bip39_mnemonic/bip39_mnemonic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:convert/convert.dart';
import 'package:web3dart/web3dart.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Text('data'),
        ElevatedButton(
          onPressed: () {
            var mnemonic = Mnemonic.generate(
              Language.english,
              passphrase: "",
              entropyLength: 256,
            );
            print(mnemonic.sentence);
            print(mnemonic.seed);
            print(hex.encode(mnemonic.seed));
            EthPrivateKey random =
                EthPrivateKey.fromHex(hex.encode(mnemonic.seed));
            log(hex.encode(random.privateKey));
            log(random.address.hex);
          },
          child: Text('Random Mnemonic'),
        )
      ],
    ));
  }
}

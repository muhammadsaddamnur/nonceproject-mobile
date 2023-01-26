import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:nonceproject_mobile/features/dashboard/data/datasources/dashboard_data_source.dart';
import 'package:web3dart/web3dart.dart';
import 'dart:math' as math;
import 'package:http/http.dart'; //You can also import the browser version

import '../../../../core/di/service_locator.dart';
import '../../../../core/wallet/vault.dart';
import '../../../../usdc.g.dart';

abstract class TransferDataSource {
  Future<String> transfer(
      {required String to, required double amount, required Coin coin});
}

@LazySingleton(as: TransferDataSource)
class TransferDataSourceImpl implements TransferDataSource {
  @override
  Future<String> transfer({
    required String to,
    required double amount,
    required Coin coin,
  }) async {
    var apiUrl =
        "https://matic-mumbai.chainstacklabs.com"; //Replace with your API

    var httpClient = Client();
    var ethClient = Web3Client(apiUrl, httpClient);

    Vault vault = getIt<Vault>();
    var get = await vault.getPrivateKey();
    var pk = EthPrivateKey.fromHex(get!);

    var userAddress = pk.address;
    log('user address : $userAddress');

    var contractAddress = EthereumAddress.fromHex(
      '0x5945Ce1AF223b2124E1808dacC0867103fcC55B4',
    );

    var toAddress = EthereumAddress.fromHex(
      to,
    );
    log('to address : $toAddress');

    String res = '';
    switch (coin) {
      case Coin.native:
        res = (await ethClient.sendTransaction(
          pk,
          Transaction(
            to: toAddress,
            value: EtherAmount.fromInt(
              EtherUnit.wei,
              (amount * math.pow(10, 18)).toInt(),
            ),
          ),
          chainId: 80001,
        ));
        log(res);

        break;
      case Coin.usdc:
        Usdc usdc = Usdc(
          address: contractAddress,
          client: ethClient,
          chainId: 80001,
        );
        log('contract address : ${usdc.self.address}');
        log(EtherAmount.fromInt(EtherUnit.wei, 100000).toString());
        var decimal = await usdc.decimals();
        log((amount * math.pow(10, int.parse(decimal.toString()))).toString());
        res = await usdc.transfer(
          toAddress,
          BigInt.parse((amount * math.pow(10, int.parse(decimal.toString())))
              .toInt()
              .toString()),
          credentials: pk,
        );
        log(res);

        break;
      default:
    }
    log(res);

    return res;
  }
}

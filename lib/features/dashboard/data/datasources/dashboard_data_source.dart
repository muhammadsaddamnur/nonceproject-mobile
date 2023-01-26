import 'dart:developer';
import 'dart:math' as math;
import 'package:http/http.dart'; //You can also import the browser version
import 'package:injectable/injectable.dart';

import 'package:web3dart/web3dart.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/wallet/vault.dart';
import '../../../../usdc.g.dart';

enum Coin { native, usdc }

abstract class DashboardDataSource {
  Future<double> getBalance({required Coin coin});
}

@LazySingleton(as: DashboardDataSource)
class DashboardDataSourceImpl implements DashboardDataSource {
  @override
  Future<double> getBalance({required Coin coin}) async {
    var apiUrl =
        "https://matic-mumbai.chainstacklabs.com"; //Replace with your API

    var httpClient = Client();
    var ethClient = Web3Client(apiUrl, httpClient);

    Vault vault = getIt<Vault>();
    var get = await vault.getPrivateKey();
    var pk = EthPrivateKey.fromHex(get!);

    var userAddress = pk.address;
    log('user address : $userAddress');
    double res = 0.0;
    switch (coin) {
      case Coin.native:
        res = (await ethClient.getBalance(userAddress)).getInWei.toDouble() /
            math.pow(10, 18);
        break;
      case Coin.usdc:
        var contractAddress = EthereumAddress.fromHex(
          '0x5945Ce1AF223b2124E1808dacC0867103fcC55B4',
        );
        Usdc usdc = Usdc(address: contractAddress, client: ethClient);
        var userBalance = await usdc.balanceOf(userAddress);
        var decimal = await usdc.decimals();

        res = double.parse(userBalance.toString()) /
            math.pow(10, int.parse(decimal.toString()));
        break;
      default:
    }
    return res;
  }
}

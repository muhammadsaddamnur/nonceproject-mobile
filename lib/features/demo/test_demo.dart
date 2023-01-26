import 'dart:convert';
import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart'; //You can also import the browser version
import 'package:web3dart/src/contracts/abi/abi.dart';
import 'package:bip39_mnemonic/bip39_mnemonic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:convert/convert.dart';
import 'package:nonceproject_mobile/core/di/service_locator.dart';
import 'package:nonceproject_mobile/core/usecase/usecase.dart';
import 'package:nonceproject_mobile/core/wallet/vault.dart';
import 'package:nonceproject_mobile/features/register/domain/entities/generate_entity.dart';
import 'package:nonceproject_mobile/features/register/domain/usecases/generate_from_mnemonic.dart';
import 'package:nonceproject_mobile/usdc.g.dart';
import 'package:web3dart/web3dart.dart';

class TestDemoPage extends StatelessWidget {
  const TestDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test Demo'),
        ),
        body: ListView(
          children: [
            ElevatedButton(
              onPressed: () async {
                var s = (await getIt<GenerateFromMnemonic>().call(NoParams()))
                    .getOrElse(
                        () => GenerateEntity(sentence: '', privateKey: ''));
                log(s.privateKey);
                log(EthPrivateKey.fromHex(s.privateKey).address.hex);
                Vault vault = getIt<Vault>();
                var res = await vault.storePrivateKey(value: s.privateKey);
                log('create vault : $res');
                var get = await vault.getPrivateKey();
                log('get vault : $get');
              },
              child: const Text('Random Mnemonic'),
            ),
            ElevatedButton(
              onPressed: () async {
                Vault vault = getIt<Vault>();
                var get = await vault.getPrivateKey();
                log('get vault : $get');
              },
              child: const Text('Get Private Key'),
            ),
            ElevatedButton(
              onPressed: () async {
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
                Usdc usdc = Usdc(address: contractAddress, client: ethClient);
                var userBalance = await usdc.balanceOf(userAddress);
                var decimal = await usdc.decimals();
                var symbol = await usdc.symbol();
                var b = await ethClient.getBalance(userAddress);
                log('matic balance : ${b.getInWei}');
                log(decimal.toString());
                log(userBalance.toString());
                log(
                  (int.parse(userBalance.toString()) /
                              math.pow(10, int.parse(decimal.toString())))
                          .toString() +
                      symbol,
                );
              },
              child: const Text('Get Balance'),
            ),
            ElevatedButton(
              onPressed: () async {
                late DeployedContract usdcContract;
                late ContractFunction balanceOf;

                var apiUrl =
                    "https://matic-mumbai.chainstacklabs.com"; //Replace with your API

                var httpClient = Client();
                var ethClient = Web3Client(apiUrl, httpClient);

                Vault vault = getIt<Vault>();
                var get = await vault.getPrivateKey();
                var pk = EthPrivateKey.fromHex(get!);
                var userAddress = pk.address;

                var contractAddress = EthereumAddress.fromHex(
                  '0x5945Ce1AF223b2124E1808dacC0867103fcC55B4',
                );

                final abi = json.encode(
                  json.decode(
                    await rootBundle.loadString('assets/usdc.abi.json'),
                  ),
                );
                usdcContract = DeployedContract(
                  ContractAbi.fromJson(abi, 'usdc'),
                  contractAddress,
                );

                balanceOf = usdcContract.function('balanceOf');

                final balance = await ethClient.call(
                  sender: userAddress,
                  contract: usdcContract,
                  function: balanceOf,
                  params: [userAddress],
                );
                log(balance.toString());
              },
              child: const Text('Get Balance (Manual Smart contract)'),
            ),
            ElevatedButton(
              onPressed: () async {
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
                  '0x4D16D1040C114C07Ff51547ff714B026FF2Ec522',
                );
                log('to address : $toAddress');

                Usdc usdc = Usdc(
                  address: contractAddress,
                  client: ethClient,
                  chainId: 80001,
                );
                log('contract address : ${usdc.self.address}');
                log(EtherAmount.fromInt(EtherUnit.wei, 100000).toString());

                var res = await usdc.transfer(
                  toAddress,
                  BigInt.from(100000),
                  credentials: pk,
                );
                log(res);
              },
              child: const Text('Transfer'),
            ),
          ],
        ));
  }
}

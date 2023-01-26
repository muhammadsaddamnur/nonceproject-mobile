import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nonceproject_mobile/features/dashboard/data/datasources/dashboard_data_source.dart';
import 'package:nonceproject_mobile/features/transfer/presentation/cubit/transfer_cubit.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/routes/app_router.dart';

class TransferPage extends StatefulWidget {
  final Coin coin;

  const TransferPage({
    Key? key,
    required this.coin,
  }) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  TextEditingController address = TextEditingController();
  TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransferCubit(),
      child: Scaffold(
        appBar: AppBar(automaticallyImplyLeading: false),
        body: Padding(
          padding: EdgeInsets.only(right: 10.w, left: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 1.sw,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/matic.png'),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      'Jaringan Polygon',
                      style: TextStyle(color: Color(0xffD2D2D2)),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Mengirim ke',
                style: TextStyle(color: Color(0xffD2D2D2)),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: address,
                decoration: InputDecoration(hintText: '0x....'),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Nominal',
                style: TextStyle(color: Color(0xffD2D2D2)),
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                controller: amount,
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(hintText: widget.coin.name.toUpperCase()),
              ),
            ],
          ),
        ),
        persistentFooterButtons: [
          Padding(
            padding: EdgeInsets.only(right: 10.w, left: 10.w),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 21),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text('🕵️'),
                      ),
                      Expanded(
                        child: Text(
                            'Pastikan alamat dan jaringan yang kamu masukan sudah benar, kesalahan pada alamat dan jaringan akan menyebabkan kamu kehilangan aset.'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 1.sw,
                  child: BlocConsumer<TransferCubit, TransferState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: (tx) {
                          log(tx.toString());
                          getIt<AppRouter>().replaceAll([DashboardRoute()]);
                        },
                      );
                    },
                    builder: (context, state) {
                      return BlocBuilder<TransferCubit, TransferState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: () {
                              context.read<TransferCubit>().transfer(
                                    to: address.text,
                                    amount: double.parse(amount.text),
                                    coin: widget.coin,
                                  );
                            },
                            child: const Text('Kirim'),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nonceproject_mobile/core/di/service_locator.dart';
import 'package:nonceproject_mobile/core/routes/app_router.dart';
import 'package:nonceproject_mobile/features/dashboard/data/datasources/dashboard_data_source.dart';
import 'package:nonceproject_mobile/features/dashboard/presentation/cubit/dashboard_cubit.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit()
        ..getBalanceCoin(coin: Coin.native)
        ..getBalanceCoin(coin: Coin.usdc),
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Container(
              height: 100,
              child: Center(
                child: Text('Jaringan Polygon Mumbai'),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff312D2D),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.sp),
                    topRight: Radius.circular(15.sp),
                  ),
                ),
                child: BlocBuilder<DashboardCubit, DashboardState>(
                  builder: (context, state) {
                    return ListView(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Container(
                              width: 50,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.sp),
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          leading: Image.asset(
                            'assets/images/matic.png',
                            width: 47.w,
                            height: 47.w,
                          ),
                          title: const Text(
                            'MATIC',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            state.maybeWhen(
                              success: (native, usdc) =>
                                  native?.toString() ?? '0.0',
                              orElse: () => '0.0',
                            ),
                          ),
                          onTap: () {
                            getIt<AppRouter>()
                                .push(TransferRoute(coin: Coin.native));
                          },
                        ),
                        ListTile(
                          leading: Image.asset(
                            'assets/images/usdc.png',
                            width: 47.w,
                            height: 47.w,
                          ),
                          title: const Text(
                            'USDC',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            state.maybeWhen(
                              success: (native, usdc) =>
                                  usdc?.toString() ?? '0.0',
                              orElse: () => '0.0',
                            ),
                          ),
                          onTap: () {
                            getIt<AppRouter>()
                                .push(TransferRoute(coin: Coin.usdc));
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

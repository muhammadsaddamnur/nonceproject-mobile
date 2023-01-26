import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nonceproject_mobile/core/di/service_locator.dart';
import 'package:nonceproject_mobile/core/routes/app_router.dart';
//You can also import the browser version
import 'package:nonceproject_mobile/features/register/presentation/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit()..generate(),
      child: Scaffold(
        body: SizedBox(
          width: 1.sw,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'SEED PHRASE',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 30.h,
              ),
              BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  return state.maybeMap(
                    success: (value) => Padding(
                      padding: EdgeInsets.only(right: 10.w, left: 10.w),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        spacing: 10,
                        children: value.generateEntity!.sentence
                            .split(' ')
                            .map((e) => Chip(label: Text(e)))
                            .toList(),
                      ),
                    ),
                    orElse: () => const SizedBox(),
                  );
                },
              ),
              SizedBox(
                height: 30.h,
              ),
              IntrinsicWidth(
                child: BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () async {
                        state.whenOrNull(
                          success: (value) async {
                            StringBuffer sentenceString = StringBuffer();
                            sentenceString.writeAll(
                                value!.sentence.split(' '), ' ');
                            Clipboard.setData(ClipboardData(
                                    text: sentenceString.toString()))
                                .then((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Seed phrase berhasil di salin")));
                            });
                          },
                        );
                      },
                      borderRadius: BorderRadius.circular(15.sp),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Icon(Icons.copy),
                            SizedBox(
                              width: 3,
                            ),
                            Text('salin'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
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
                        child: Text('🔑'),
                      ),
                      Expanded(
                        child: Text(
                            'Simpan seed pharse ini di tempat yang aman, biar lebih keamanan kamu bisa menuliskannya di sebuah kertas.'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 1.sw,
                  child: BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        saved: () {
                          getIt<AppRouter>().push(DashboardRoute());
                        },
                      );
                    },
                    builder: (context, state) {
                      return BlocBuilder<RegisterCubit, RegisterState>(
                        builder: (context, state) {
                          return state.maybeMap(
                            success: (value) {
                              return ElevatedButton(
                                onPressed: () {
                                  context.read<RegisterCubit>().storeVault(
                                        value.generateEntity!,
                                      );
                                },
                                child: const Text('Lanjut'),
                              );
                            },
                            orElse: () => SizedBox(),
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

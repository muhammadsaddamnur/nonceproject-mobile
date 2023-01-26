import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nonceproject_mobile/core/routes/auth_guard.dart';

import 'core/di/service_locator.dart';
import 'core/routes/app_router.dart';
import 'core/ui/colors/colors_scheme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  getIt.registerSingleton<AppRouter>(AppRouter(authGuard: AuthGuard()));
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();

    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData.light().copyWith(
            primaryColor: const Color(0xffFF5F1F),
            backgroundColor: const Color(0xff212121),
            scaffoldBackgroundColor: const Color(0xff212121),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xff212121),
              elevation: 0,
              foregroundColor: Colors.white,
            ),
            dividerTheme: const DividerThemeData(
              color: Colors.transparent,
            ),
            textTheme:
                Theme.of(context).textTheme.apply(bodyColor: Colors.white),
            listTileTheme: const ListTileThemeData(
              textColor: Colors.white,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xffFF5F1F),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
                ),
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            chipTheme: ChipThemeData(
              backgroundColor: const Color(0xff312D2D),
              labelPadding: EdgeInsets.only(right: 10.w, left: 10.w),
              labelStyle: TextStyle(color: Colors.white, fontSize: 12.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.sp),
              ),
              side: const BorderSide(
                color: Color(0xff312D2D),
              ),
            ),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: const Color(0xff312D2D),
              hintStyle: const TextStyle(color: Color(0xffD2D2D2)),
              labelStyle: const TextStyle(color: Color(0xffD2D2D2)),
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 93, 86, 86)),
                borderRadius: BorderRadius.circular(5.r),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff312D2D)),
                borderRadius: BorderRadius.circular(5.r),
              ),
            ),
            extensions: <ThemeExtension<dynamic>>[
              ColorsScheme.light,
            ],
          ),
          routerDelegate: AutoRouterDelegate(router),
          routeInformationParser: router.defaultRouteParser(),
        );
      },
    );
  }
}

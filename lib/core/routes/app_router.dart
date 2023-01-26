import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nonceproject_mobile/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:nonceproject_mobile/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:nonceproject_mobile/features/pin/presentation/pages/pin_page.dart';
import 'package:nonceproject_mobile/features/register/presentation/pages/register_page.dart';
import 'package:nonceproject_mobile/features/startup/presentation/pages/startup_page.dart';

import '../../features/dashboard/data/datasources/dashboard_data_source.dart';
import '../../features/demo/test_demo.dart';
import '../../features/transfer/presentation/pages/transfer_page.dart';
import 'auth_guard.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: TestDemoPage),
    AutoRoute(page: StartupPage, initial: true),
    AutoRoute(page: OnboardingPage),
    AutoRoute(page: PinPage),
    AutoRoute(page: RegisterPage),
    AutoRoute(page: TransferPage),
    AutoRoute(page: DashboardPage, guards: [AuthGuard]),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({required super.authGuard});
}

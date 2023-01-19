import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nonceproject_mobile/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:nonceproject_mobile/features/register/presentation/pages/register_page.dart';
import 'package:nonceproject_mobile/features/startup/presentation/pages/startup_page.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: StartupPage),
    AutoRoute(page: RegisterPage, initial: true),
    AutoRoute(page: DashboardPage),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}

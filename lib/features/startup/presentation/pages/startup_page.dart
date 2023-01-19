import 'package:flutter/material.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/routes/app_router.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () => getIt<AppRouter>().replaceAll([const DashboardRoute()]),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Nonceproject'),
      ),
    );
  }
}

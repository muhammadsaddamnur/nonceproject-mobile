import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:nonceproject_mobile/core/routes/app_router.dart';
import 'package:nonceproject_mobile/core/wallet/vault.dart';

import '../di/service_locator.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    Vault vault = getIt<Vault>();

    String? pk = await vault.getPrivateKey();
    log('current user : $pk');
    if (pk == null) {
      // router.replace(
      //   UnlockRoute(
      //     onResult: (value) {
      //       resolver.next(value);
      //     },
      //   ),
      // );
      router.replaceAll([OnboardingRoute()]);
    } else {
      resolver.next(true);
    }
  }
}

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter({
    GlobalKey<NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    TestDemoRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const TestDemoPage(),
      );
    },
    StartupRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const StartupPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const OnboardingPage(),
      );
    },
    PinRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const PinPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const RegisterPage(),
      );
    },
    TransferRoute.name: (routeData) {
      final args = routeData.argsAs<TransferRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: TransferPage(
          key: args.key,
          coin: args.coin,
        ),
      );
    },
    DashboardRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          TestDemoRoute.name,
          path: '/test-demo-page',
        ),
        RouteConfig(
          StartupRoute.name,
          path: '/',
        ),
        RouteConfig(
          OnboardingRoute.name,
          path: '/onboarding-page',
        ),
        RouteConfig(
          PinRoute.name,
          path: '/pin-page',
        ),
        RouteConfig(
          RegisterRoute.name,
          path: '/register-page',
        ),
        RouteConfig(
          TransferRoute.name,
          path: '/transfer-page',
        ),
        RouteConfig(
          DashboardRoute.name,
          path: '/dashboard-page',
          guards: [authGuard],
        ),
      ];
}

/// generated route for
/// [TestDemoPage]
class TestDemoRoute extends PageRouteInfo<void> {
  const TestDemoRoute()
      : super(
          TestDemoRoute.name,
          path: '/test-demo-page',
        );

  static const String name = 'TestDemoRoute';
}

/// generated route for
/// [StartupPage]
class StartupRoute extends PageRouteInfo<void> {
  const StartupRoute()
      : super(
          StartupRoute.name,
          path: '/',
        );

  static const String name = 'StartupRoute';
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute()
      : super(
          OnboardingRoute.name,
          path: '/onboarding-page',
        );

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [PinPage]
class PinRoute extends PageRouteInfo<void> {
  const PinRoute()
      : super(
          PinRoute.name,
          path: '/pin-page',
        );

  static const String name = 'PinRoute';
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/register-page',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [TransferPage]
class TransferRoute extends PageRouteInfo<TransferRouteArgs> {
  TransferRoute({
    Key? key,
    required Coin coin,
  }) : super(
          TransferRoute.name,
          path: '/transfer-page',
          args: TransferRouteArgs(
            key: key,
            coin: coin,
          ),
        );

  static const String name = 'TransferRoute';
}

class TransferRouteArgs {
  const TransferRouteArgs({
    this.key,
    required this.coin,
  });

  final Key? key;

  final Coin coin;

  @override
  String toString() {
    return 'TransferRouteArgs{key: $key, coin: $coin}';
  }
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute()
      : super(
          DashboardRoute.name,
          path: '/dashboard-page',
        );

  static const String name = 'DashboardRoute';
}

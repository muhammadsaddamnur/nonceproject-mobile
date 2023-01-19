// import 'package:auto_route/auto_route.dart';

// @override
// void onNavigation(NavigationResolver resolver, StackRouter router) async {
//   String? currentUser = await getIt<KMSServices>().getCurrentUser();
//   log('current user : $currentUser');
//   if (currentUser != null) {
//     router.replace(
//       UnlockRoute(
//         onResult: (value) {
//           resolver.next(value);
//         },
//       ),
//     );
//   } else {
//     resolver.next(true);
//   }
// }

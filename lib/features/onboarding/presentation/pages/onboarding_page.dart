import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nonceproject_mobile/core/routes/app_router.dart';

import '../../../../core/di/service_locator.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Padding(
          padding: EdgeInsets.only(right: 10.w, left: 10.w),
          child: SizedBox(
            width: 1.sw,
            child: ElevatedButton(
              onPressed: () {
                getIt<AppRouter>().push(const RegisterRoute());
              },
              child: const Text('Buat Baru'),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/core/router/router.dart';
import 'package:veryeasy/core/router/router_provider.gr.dart';

import '../../../core/core.dart';
import '../../../src/services/auth/auth_service.dart';

@RoutePage()
class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.read(authServiceProvider);

    Future.delayed(Duration(seconds: ints2), () {
      if (authService.currentUser != null) {
        autoRouterReplace(context, HomeRoute());
      } else {
        autoRouterReplace(context, LoginRoute());
      }
    });

    return Scaffold(
      backgroundColor: ComColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/gif/logo.gif'),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../../src/services/auth/auth_service.dart';
import '../providers/login_notifier.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(ds16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CompImageSvg(
                pathNetwork: 'assets/img/svg/user.svg',
                height: ds150,
              ),
              gap40,
              CompInputText(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                labelText: 'Correo electrónico',
              ),
              CompInputText(
                controller: passwordController,
                labelText: 'Contraseña',
                obscureText: true,
              ),
              gap20,
              CompButton(
                paddingContent: EdgeInsets.zero,
                backgroundColor: ComColors.primaryColor,
                borderColor: ComColors.primaryColor,
                name: 'Iniciar sesión',
                onPressed: () async {
                  final authNotifier = ref.read(loginNotifierProvider.notifier);
                  await authNotifier.signIn(
                    emailController.text,
                    passwordController.text,
                    context,
                  );
                },
              ),
              gap10,
              TextButton(
                onPressed: () async {
                  await authService.signUp(
                    emailController.text,
                    passwordController.text,
                  );
                },
                child: Text(
                  'Registrate',
                  style: ComTextStyle.button1.blue900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

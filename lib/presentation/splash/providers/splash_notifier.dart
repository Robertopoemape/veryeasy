import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veryeasy/presentation/splash/providers/splash_state.dart';

class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier() : super(SplashState(isLoaded: false)) {
    initializeSplash();
  }

  Future<void> initializeSplash() async {
    await Future.delayed(Duration(seconds: 3));
    state = SplashState(isLoaded: true);
  }
}

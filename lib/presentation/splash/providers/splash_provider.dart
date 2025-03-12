import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashState {
  final bool isLoaded;

  SplashState({required this.isLoaded});
}

// Provider para manejar el estado del Splash
final splashProvider =
    StateNotifierProvider<SplashNotifier, SplashState>((ref) {
  return SplashNotifier();
});

// Notifier que controla el estado
class SplashNotifier extends StateNotifier<SplashState> {
  SplashNotifier() : super(SplashState(isLoaded: false)) {
    initializeSplash();
  }

  Future<void> initializeSplash() async {
    // Simulamos una carga de 3 segundos
    await Future.delayed(Duration(seconds: 3));
    state = SplashState(
        isLoaded: true); // Cambiamos el estado cuando termina la carga
  }
}

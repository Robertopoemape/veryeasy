import 'package:flutter_riverpod/flutter_riverpod.dart';

// Notifier para manejar el estado de la pantalla seleccionada
class HomeNotifier extends StateNotifier<int> {
  HomeNotifier() : super(0); // El estado inicial es la pestaña "Inicio"

  void setIndex(int index) {
    state = index; // Cambia el índice seleccionado
  }
}

// Provider de HomeNotifier
final homeProvider = StateNotifierProvider<HomeNotifier, int>((ref) {
  return HomeNotifier();
});

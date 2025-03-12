import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'home_state.dart';
import '../../generator_ia/screens/generator_ia_screen.dart';
import '../../product_screens/screen/product_screen.dart';
import '../../video_ads/screens/video_ads_screen.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    return const HomeState(currentIndex: 0);
  }

  final List<String> titles = [
    'Inicio',
    'Videos',
    'Productos',
    'Inventario',
    'Generador de IA',
  ];

  final List<Widget> screens = [
    Center(child: Text('Inicio')),
    VideoAdsScreen(),
    ProductScreen(),
    Center(child: Text('Inventario')),
    GeneratorIAScreen(),
  ];

  void setIndex(int index) {
    state = state.copyWith(currentIndex: index);
  }
}

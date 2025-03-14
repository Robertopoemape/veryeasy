import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:veryeasy/presentation/home/widgets/category_card.dart';
import 'package:veryeasy/presentation/home/widgets/the_new.dart';
import '../../../components/components.dart';
import '../../../core/core.dart';
import '../providers/home_notifier.dart';
import '../widgets/carousel_slider_widget.dart';
import '../widgets/featured_product.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseHomeNotifier = ref.read(homeNotifierProvider.notifier);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSliderWidget(),
            gap20,
            CategoryCard(),
            gap20,
            FeaturedProduct(),
            gap20,
            TheNew()
          ],
        ),
      ),
      floatingActionButton: CompFloactingActionButton(
        heroTag: 'whatsapp_fab',
        widgetIcon: FaIcon(FontAwesomeIcons.whatsapp),
        onPressed: () {
          baseHomeNotifier.launchWhatsApp();
        },
      ),
    );
  }
}

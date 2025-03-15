import 'package:flutter/material.dart';
import 'package:veryeasy/presentation/home/widgets/news_card.dart';

import '../../../components/components.dart';
import '../../../core/core.dart';

class TheNew extends StatelessWidget {
  const TheNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CompSubtitle(
        title: 'Lo Nuevo',
      ),
      gap10,
      SizedBox(
        height: ds100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: ds16),
          children: [
            NewsCard(
                title: 'Nueva colección de verano',
                image: 'assets/img/png/not-img.png'),
            NewsCard(
                title: 'Lanzamiento de iPhone 15',
                image: 'assets/img/png/not-img.png'),
            NewsCard(
                title: 'Descuentos en tecnología',
                image: 'assets/img/png/not-img.png'),
          ],
        ),
      ),
    ]);
  }
}

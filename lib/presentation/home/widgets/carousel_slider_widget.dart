import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../core/core.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: ds180,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: ds16 / ds9,
        viewportFraction: ds04,
      ),
      items: [
        'assets/img/png/not-img.png',
        'assets/img/png/not-img.png',
        'assets/img/png/not-img.png'
      ].map((item) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(ds10),
          child: Image.asset(item, fit: BoxFit.cover, width: double.infinity),
        );
      }).toList(),
    );
  }
}

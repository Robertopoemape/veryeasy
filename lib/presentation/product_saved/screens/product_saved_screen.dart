import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../components/components.dart';
import '../../../core/core.dart';
import '../../../src/src.dart';

@RoutePage()
class ProductSavedScreen extends StatelessWidget {
  const ProductSavedScreen({
    required this.product,
    super.key,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ComColors.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(ds24),
            padding: const EdgeInsets.all(ds24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ds16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(ds01),
                  blurRadius: 15,
                  offset: const Offset(ds0, ds8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CompImageSvg(
                  pathNetwork: product.image,
                  width: ds250,
                  height: ds250,
                ),
                Text(
                  'Producto Guardado',
                  style: ComTextStyle.displayS.copyWith(
                    color: ComColors.bgcblack,
                  ),
                ),
                gap16,
                Text(
                  'El producto ha sido registrado exitosamente.',
                  textAlign: TextAlign.center,
                  style:
                      ComTextStyle.subtitle1.copyWith(color: ComColors.grey600),
                ),
                gap24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nombre:',
                      style: ComTextStyle.body1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ComColors.grey800,
                      ),
                    ),
                    Text(
                      product.name,
                      style: ComTextStyle.body1.copyWith(
                        color: ComColors.grey600,
                      ),
                    ),
                  ],
                ),
                gap16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Precio:',
                      style: ComTextStyle.body1.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ComColors.grey800,
                      ),
                    ),
                    Text(
                      'S/ ${product.price.toStringAsFixed(2)}',
                      style: ComTextStyle.body1.copyWith(
                        color: ComColors.grey600,
                      ),
                    ),
                  ],
                ),
                gap32,
                Center(
                  child: CompButton(
                    onPressed: () => autoRouterPop(context),
                    backgroundColor: ComColors.primaryColor,
                    borderColor: ComColors.primaryColor,
                    name: 'Volver',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:veryeasy/presentation/base_home/screens/base_home_screen.dart'
    as _i1;
import 'package:veryeasy/presentation/create_product/screens/create_product_screen.dart'
    as _i2;
import 'package:veryeasy/presentation/create_video/screens/create_video_screen.dart'
    as _i3;
import 'package:veryeasy/presentation/dashboard/screens/dashboard_screen.dart'
    as _i4;
import 'package:veryeasy/presentation/generator_ia/screens/generator_ia_screen.dart'
    as _i5;
import 'package:veryeasy/presentation/inventory/screens/inventory_screen.dart'
    as _i6;
import 'package:veryeasy/presentation/login/screens/login_screen.dart' as _i7;
import 'package:veryeasy/presentation/product/screen/product_screen.dart'
    as _i10;
import 'package:veryeasy/presentation/product_detail/screens/product_detail_screen.dart'
    as _i8;
import 'package:veryeasy/presentation/product_saved/screens/product_saved_screen.dart'
    as _i9;
import 'package:veryeasy/presentation/setting/screens/setting_screen.dart'
    as _i11;
import 'package:veryeasy/presentation/splash/screens/splash_screen.dart'
    as _i12;
import 'package:veryeasy/presentation/upload_video/screens/upload_video_screen.dart'
    as _i13;
import 'package:veryeasy/presentation/video_ads/screens/video_ads_screen.dart'
    as _i14;
import 'package:veryeasy/presentation/video_detail/screens/video_detail_screen.dart'
    as _i15;
import 'package:veryeasy/src/src.dart' as _i18;

/// generated route for
/// [_i1.BaseHomeScreen]
class BaseHomeRoute extends _i16.PageRouteInfo<void> {
  const BaseHomeRoute({List<_i16.PageRouteInfo>? children})
    : super(BaseHomeRoute.name, initialChildren: children);

  static const String name = 'BaseHomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.BaseHomeScreen();
    },
  );
}

/// generated route for
/// [_i2.CreateProductScreen]
class CreateProductRoute extends _i16.PageRouteInfo<void> {
  const CreateProductRoute({List<_i16.PageRouteInfo>? children})
    : super(CreateProductRoute.name, initialChildren: children);

  static const String name = 'CreateProductRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i2.CreateProductScreen();
    },
  );
}

/// generated route for
/// [_i3.CreateVideoIAScreen]
class CreateVideoIARoute extends _i16.PageRouteInfo<void> {
  const CreateVideoIARoute({List<_i16.PageRouteInfo>? children})
    : super(CreateVideoIARoute.name, initialChildren: children);

  static const String name = 'CreateVideoIARoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.CreateVideoIAScreen();
    },
  );
}

/// generated route for
/// [_i4.DashboardScreen]
class DashboardRoute extends _i16.PageRouteInfo<void> {
  const DashboardRoute({List<_i16.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i4.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i5.GeneratorIAScreen]
class GeneratorIARoute extends _i16.PageRouteInfo<void> {
  const GeneratorIARoute({List<_i16.PageRouteInfo>? children})
    : super(GeneratorIARoute.name, initialChildren: children);

  static const String name = 'GeneratorIARoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i5.GeneratorIAScreen();
    },
  );
}

/// generated route for
/// [_i6.InventoryScreen]
class InventoryRoute extends _i16.PageRouteInfo<void> {
  const InventoryRoute({List<_i16.PageRouteInfo>? children})
    : super(InventoryRoute.name, initialChildren: children);

  static const String name = 'InventoryRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i6.InventoryScreen();
    },
  );
}

/// generated route for
/// [_i7.LoginScreen]
class LoginRoute extends _i16.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i17.Key? key, List<_i16.PageRouteInfo>? children})
    : super(
        LoginRoute.name,
        args: LoginRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'LoginRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i7.LoginScreen(key: args.key);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i17.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ProductDetailScreen]
class ProductDetailRoute extends _i16.PageRouteInfo<void> {
  const ProductDetailRoute({List<_i16.PageRouteInfo>? children})
    : super(ProductDetailRoute.name, initialChildren: children);

  static const String name = 'ProductDetailRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProductDetailScreen();
    },
  );
}

/// generated route for
/// [_i9.ProductSavedScreen]
class ProductSavedRoute extends _i16.PageRouteInfo<ProductSavedRouteArgs> {
  ProductSavedRoute({
    required _i18.Product product,
    _i17.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         ProductSavedRoute.name,
         args: ProductSavedRouteArgs(product: product, key: key),
         initialChildren: children,
       );

  static const String name = 'ProductSavedRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductSavedRouteArgs>();
      return _i9.ProductSavedScreen(product: args.product, key: args.key);
    },
  );
}

class ProductSavedRouteArgs {
  const ProductSavedRouteArgs({required this.product, this.key});

  final _i18.Product product;

  final _i17.Key? key;

  @override
  String toString() {
    return 'ProductSavedRouteArgs{product: $product, key: $key}';
  }
}

/// generated route for
/// [_i10.ProductScreen]
class ProductRoute extends _i16.PageRouteInfo<void> {
  const ProductRoute({List<_i16.PageRouteInfo>? children})
    : super(ProductRoute.name, initialChildren: children);

  static const String name = 'ProductRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i10.ProductScreen();
    },
  );
}

/// generated route for
/// [_i11.SettingScreen]
class SettingRoute extends _i16.PageRouteInfo<void> {
  const SettingRoute({List<_i16.PageRouteInfo>? children})
    : super(SettingRoute.name, initialChildren: children);

  static const String name = 'SettingRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.SettingScreen();
    },
  );
}

/// generated route for
/// [_i12.SplashScreen]
class SplashRoute extends _i16.PageRouteInfo<void> {
  const SplashRoute({List<_i16.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashScreen();
    },
  );
}

/// generated route for
/// [_i13.UploadVideoScreen]
class UploadVideoRoute extends _i16.PageRouteInfo<void> {
  const UploadVideoRoute({List<_i16.PageRouteInfo>? children})
    : super(UploadVideoRoute.name, initialChildren: children);

  static const String name = 'UploadVideoRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i13.UploadVideoScreen();
    },
  );
}

/// generated route for
/// [_i14.VideoAdsScreen]
class VideoAdsRoute extends _i16.PageRouteInfo<void> {
  const VideoAdsRoute({List<_i16.PageRouteInfo>? children})
    : super(VideoAdsRoute.name, initialChildren: children);

  static const String name = 'VideoAdsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i14.VideoAdsScreen();
    },
  );
}

/// generated route for
/// [_i15.VideoDetailScreen]
class VideoDetailRoute extends _i16.PageRouteInfo<void> {
  const VideoDetailRoute({List<_i16.PageRouteInfo>? children})
    : super(VideoDetailRoute.name, initialChildren: children);

  static const String name = 'VideoDetailRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i15.VideoDetailScreen();
    },
  );
}

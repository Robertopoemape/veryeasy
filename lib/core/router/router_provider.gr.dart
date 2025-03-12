// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:veryeasy/presentation/configuration/screens/inventory_screen.dart'
    as _i1;
import 'package:veryeasy/presentation/create_video/screens/create_video_screen.dart'
    as _i2;
import 'package:veryeasy/presentation/dashboard/screens/dashboard_screen.dart'
    as _i3;
import 'package:veryeasy/presentation/home/screens/home_screen.dart' as _i4;
import 'package:veryeasy/presentation/inventory/screens/inventory_screen.dart'
    as _i5;
import 'package:veryeasy/presentation/login/screens/login_screen.dart' as _i6;
import 'package:veryeasy/presentation/product_detail/screens/product_detail_screen.dart'
    as _i7;
import 'package:veryeasy/presentation/product_screens/screen/product_screen.dart'
    as _i8;
import 'package:veryeasy/presentation/splash/screens/splash_screen.dart' as _i9;
import 'package:veryeasy/presentation/upload_video/screens/upload_video_screen.dart'
    as _i10;
import 'package:veryeasy/presentation/video_ads/screens/video_ads_screen.dart'
    as _i11;
import 'package:veryeasy/presentation/video_detail/screens/video_detail_screen.dart'
    as _i12;

/// generated route for
/// [_i1.ConfigurationScreen]
class ConfigurationRoute extends _i13.PageRouteInfo<void> {
  const ConfigurationRoute({List<_i13.PageRouteInfo>? children})
    : super(ConfigurationRoute.name, initialChildren: children);

  static const String name = 'ConfigurationRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.ConfigurationScreen();
    },
  );
}

/// generated route for
/// [_i2.CreateVideoIAScreen]
class CreateVideoIARoute extends _i13.PageRouteInfo<void> {
  const CreateVideoIARoute({List<_i13.PageRouteInfo>? children})
    : super(CreateVideoIARoute.name, initialChildren: children);

  static const String name = 'CreateVideoIARoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i2.CreateVideoIAScreen();
    },
  );
}

/// generated route for
/// [_i3.DashboardScreen]
class DashboardRoute extends _i13.PageRouteInfo<void> {
  const DashboardRoute({List<_i13.PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.DashboardScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.InventoryScreen]
class InventoryRoute extends _i13.PageRouteInfo<void> {
  const InventoryRoute({List<_i13.PageRouteInfo>? children})
    : super(InventoryRoute.name, initialChildren: children);

  static const String name = 'InventoryRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.InventoryScreen();
    },
  );
}

/// generated route for
/// [_i6.LoginScreen]
class LoginRoute extends _i13.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i14.Key? key, List<_i13.PageRouteInfo>? children})
    : super(
        LoginRoute.name,
        args: LoginRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'LoginRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return _i6.LoginScreen(key: args.key);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.ProductDetailScreen]
class ProductDetailRoute extends _i13.PageRouteInfo<void> {
  const ProductDetailRoute({List<_i13.PageRouteInfo>? children})
    : super(ProductDetailRoute.name, initialChildren: children);

  static const String name = 'ProductDetailRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProductDetailScreen();
    },
  );
}

/// generated route for
/// [_i8.ProductScreen]
class ProductRoute extends _i13.PageRouteInfo<void> {
  const ProductRoute({List<_i13.PageRouteInfo>? children})
    : super(ProductRoute.name, initialChildren: children);

  static const String name = 'ProductRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProductScreen();
    },
  );
}

/// generated route for
/// [_i9.SplashScreen]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i9.SplashScreen();
    },
  );
}

/// generated route for
/// [_i10.UploadVideoScreen]
class UploadVideoRoute extends _i13.PageRouteInfo<void> {
  const UploadVideoRoute({List<_i13.PageRouteInfo>? children})
    : super(UploadVideoRoute.name, initialChildren: children);

  static const String name = 'UploadVideoRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i10.UploadVideoScreen();
    },
  );
}

/// generated route for
/// [_i11.VideoAdsScreen]
class VideoAdsRoute extends _i13.PageRouteInfo<void> {
  const VideoAdsRoute({List<_i13.PageRouteInfo>? children})
    : super(VideoAdsRoute.name, initialChildren: children);

  static const String name = 'VideoAdsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i11.VideoAdsScreen();
    },
  );
}

/// generated route for
/// [_i12.VideoDetailScreen]
class VideoDetailRoute extends _i13.PageRouteInfo<void> {
  const VideoDetailRoute({List<_i13.PageRouteInfo>? children})
    : super(VideoDetailRoute.name, initialChildren: children);

  static const String name = 'VideoDetailRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i12.VideoDetailScreen();
    },
  );
}

part of 'router_provider.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class MicroAppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => CustomRouteType(
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: CreateProductRoute.page),
        AutoRoute(page: BaseHomeRoute.page),
        AutoRoute(page: DashboardRoute.page),
        AutoRoute(page: VideoAdsRoute.page),
        AutoRoute(page: ProductRoute.page),
        AutoRoute(page: InventoryRoute.page),
        AutoRoute(page: GeneratorIARoute.page),
        AutoRoute(page: SettingRoute.page),
        AutoRoute(page: VideoDetailRoute.page),
        AutoRoute(page: ProductDetailRoute.page),
        AutoRoute(page: CreateVideoIARoute.page),
        AutoRoute(page: UploadVideoRoute.page),
        AutoRoute(page: ProductSavedRoute.page),
      ];
}

import 'package:custom_router/custom_route_configuration.dart';
import 'package:custom_router/custom_router_page.dart';
import 'package:flutter/widgets.dart';

class CustomRouterDelegate extends RouterDelegate<CustomRouteConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<CustomRouteConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey;
  final List<CustomRouterPage> pages;
  final Map<String, WidgetBuilder> routes;
  final WidgetBuilder onUnknownRoute;
  final String initialRoute;

  CustomRouterPage? get currentPage => pages.isNotEmpty ? pages.last : null;

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  CustomRouteConfiguration get currentConfiguration {
    final page = currentPage;
    return CustomRouteConfiguration(
      path: page?.name ?? initialRoute,
      queryParameters: page?.queryParameters ?? {},
    );
  }

  CustomRouterDelegate(this.routes,
      {required this.onUnknownRoute, required this.initialRoute})
      : _navigatorKey = GlobalKey<NavigatorState>(),
        pages = routes.containsKey(initialRoute)
            ? [
                CustomRouterPage(
                    name: initialRoute, builder: routes[initialRoute]!)
              ]
            : [];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: (route, result) {
        if (route.didPop(result) && pages.length > 1) {
          pages.removeLast();
          return true;
        }
        return false;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(CustomRouteConfiguration configuration) async {
    pages.insert(
        0,
        CustomRouterPage(
          name: configuration.path,
          queryParameters: configuration.queryParameters,
          builder: routes.containsKey(configuration.path)
              ? routes[configuration.path]!
              : onUnknownRoute,
        ));
  }
}

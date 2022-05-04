import 'package:custom_router/custom_route_configuration.dart';
import 'package:custom_router/custom_router_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomRouterDelegate extends RouterDelegate<CustomRouteConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<CustomRouteConfiguration> {
  final Map<String, WidgetBuilder> routes;
  final WidgetBuilder onUnknownRoute;
  final String initialRoute;

  final CustomRouterState _state = CustomRouterState.instance;
  final GlobalKey<NavigatorState> _navigatorKey;

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  CustomRouteConfiguration get currentConfiguration {
    return _state.stack.last;
  }

  CustomRouterDelegate(
    this.routes, {
    required this.onUnknownRoute,
    required this.initialRoute,
  }) : _navigatorKey = GlobalKey<NavigatorState>() {
    _state.addListener(notifyListeners);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: getPages(),
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        if (_state.stack.length == 1) {
          return false;
        }

        _state.pop();

        return true;
      },
    );
  }

  List<Page> getPages() {
    return _state.stack.map((config) {
      return MaterialPage(
        key: ValueKey('${config.path}${config.queryParameters}'),
        child: Builder(
          builder: routes.containsKey(config.path)
              ? routes[config.path]!
              : onUnknownRoute,
        ),
      );
    }).toList();
  }

  @override
  Future<void> setNewRoutePath(CustomRouteConfiguration configuration) async {
    _state.setState(stack: [configuration]);

    return SynchronousFuture(null);
  }
}

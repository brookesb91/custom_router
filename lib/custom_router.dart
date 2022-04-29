import 'package:custom_router/custom_route_parser.dart';
import 'package:custom_router/custom_router_delegate.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  final Map<String, WidgetBuilder> routes;
  final String initialRoute;
  final WidgetBuilder onUnknownRoute;
  final CustomRouterDelegate delegate;
  final CustomRouteParser parser;

  CustomRouter(
    this.routes, {
    required this.onUnknownRoute,
    this.initialRoute = '/',
  })  : delegate = CustomRouterDelegate(routes,
            onUnknownRoute: onUnknownRoute, initialRoute: initialRoute),
        parser = CustomRouteParser();
}

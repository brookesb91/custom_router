import 'package:custom_router/custom_route_parser.dart';
import 'package:custom_router/custom_router_delegate.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  final Map<String, WidgetBuilder> routes;

  final CustomRouterDelegate delegate;
  final CustomRouteParser parser;

  CustomRouter(
    this.routes, {
    Key? key,
    required WidgetBuilder onUnknownRoute,
    String initialRoute = '/',
  })  : delegate = CustomRouterDelegate(routes,
            onUnknownRoute: onUnknownRoute, initialRoute: initialRoute),
        parser = CustomRouteParser();
}

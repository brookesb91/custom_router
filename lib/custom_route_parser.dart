import 'package:custom_router/custom_route_configuration.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// The parser used to parse the route name and query parameters from the
/// `[RouteInformation].location` property.
///
/// This configuration is used to determine the page that will be navigated to
/// and will be passed to the `CustomRouterDelegate`.
class CustomRouteParser
    extends RouteInformationParser<CustomRouteConfiguration> {
  @override
  Future<CustomRouteConfiguration> parseRouteInformation(
      RouteInformation routeInformation) {
    final uri = Uri.parse(routeInformation.location ?? '/');

    final config = CustomRouteConfiguration(
        path: uri.path,
        queryParameters:
            uri.queryParameters.isEmpty ? null : uri.queryParameters);

    return SynchronousFuture(config);
  }

  @override
  RouteInformation restoreRouteInformation(
      CustomRouteConfiguration configuration) {
    final uri = Uri(
        path: configuration.path,
        queryParameters: configuration.queryParameters);
    return RouteInformation(location: uri.toString());
  }
}

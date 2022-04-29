import 'package:custom_router/custom_route_configuration.dart';
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
    assert(routeInformation.location != null);

    final uri = Uri.parse(routeInformation.location!);
    final config = CustomRouteConfiguration(
        path: uri.path, queryParameters: uri.queryParameters);

    return Future.value(config);
  }
}

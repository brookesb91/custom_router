import 'package:custom_router/custom_router.dart';
import 'package:flutter/material.dart';

class RouteStateBuilder extends StatelessWidget {
  final CustomRouterState _state = CustomRouterState.instance;
  final Function(BuildContext context, CustomRouteConfiguration config) builder;

  RouteStateBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final config = _state.currentConfiguration;

    return builder(context, config);
  }
}

import 'package:custom_router/custom_router_state.dart';
import 'package:flutter/material.dart';

class RouteState {
  final String path;
  final Map<String, String> queryParameters;

  RouteState({
    required this.path,
    this.queryParameters = const {},
  });
}

class RouteStateBuilder extends StatelessWidget {
  final CustomRouterState _state = CustomRouterState.instance;
  final Function(BuildContext context, RouteState state) builder;

  RouteStateBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      RouteState(
        path: _state.path,
        queryParameters: _state.queryParameters,
      ),
    );
  }
}

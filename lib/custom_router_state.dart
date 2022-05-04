import 'package:custom_router/custom_route_configuration.dart';
import 'package:flutter/material.dart';

class CustomRouterState extends ChangeNotifier {
  static final CustomRouterState _instance = CustomRouterState();
  static CustomRouterState get instance => _instance;

  List<CustomRouteConfiguration> _stack = [];
  List<CustomRouteConfiguration> get stack => _stack;

  Map<String, String> get queryParameters =>
      _stack.isEmpty ? {} : _stack.last.queryParameters!;

  String get path => _stack.isEmpty ? '' : _stack.last.path;

  void navigate(String path, {Map<String, String>? queryParameters}) {
    _stack.add(CustomRouteConfiguration(
      path: path,
      queryParameters: queryParameters,
    ));

    notifyListeners();
  }

  void setState({List<CustomRouteConfiguration>? stack}) {
    _stack = stack ?? _stack;

    notifyListeners();
  }

  void pop() {
    _stack.removeLast();

    notifyListeners();
  }
}

extension CustomRouterStateContextExtension on BuildContext {
  CustomRouterState get router => CustomRouterState.instance;
}

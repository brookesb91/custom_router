import 'package:flutter/material.dart';

class CustomRouterPage extends Page {
  final Map<String, String> queryParameters;
  final WidgetBuilder builder;

  const CustomRouterPage({
    required String name,
    required this.builder,
    this.queryParameters = const {},
  }) : super(name: name);

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute<void>(settings: this, builder: builder);
  }
}

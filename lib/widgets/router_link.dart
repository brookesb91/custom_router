import 'package:custom_router/custom_router_state.dart';
import 'package:flutter/widgets.dart';

class RouterLink extends StatelessWidget {
  final String path;
  final Map<String, String>? queryParameters;
  final Function(BuildContext context, void Function() go) builder;

  const RouterLink(
    this.path, {
    Key? key,
    this.queryParameters,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builder(context, () {
      context.router.navigate(path, queryParameters: queryParameters);
    });
  }
}

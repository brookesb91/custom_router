import 'package:flutter/widgets.dart';

class RouterLink extends StatelessWidget {
  final String path;
  final Map<String, String> queryParameters;
  final Function(BuildContext context, void Function() go) builder;

  const RouterLink(
    this.path, {
    Key? key,
    this.queryParameters = const {},
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uri = Uri(path: path, queryParameters: queryParameters);

    return builder(context, () {
      Navigator.pushNamed(context, uri.toString());
    });
  }
}

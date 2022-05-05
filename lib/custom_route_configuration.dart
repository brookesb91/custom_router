class CustomRouteConfiguration {
  final String path;
  final Map<String, String> queryParameters;

  CustomRouteConfiguration(
      {required this.path, this.queryParameters = const {}});
}

# Custom Flutter Router

## Usage

```dart
import 'package:custom_router/custom_router.dart';

class App extends StatelessWidget {
  /// Create a `CustomRouter`
  /// by supplying a string map of widget builders
  /// and a builder for unknown routes.
  final CustomRouter _router = CustomRouter(
    {
      '/': (context) => const HomePage(),
      '/login': (context) => const LoginPage(),
    },
    onUnknownRoute: (context) {
      return const Text('Route Not Found.');
    },
  );

  const App({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    /// Use the router.
    return MaterialApp.router(
      routeInformationParser: _router.parser,
      routerDelegate: _router.delegate,
    );
  }
}
```

# Custom Flutter Router

## Install

In `pubspec.yaml`:

```yaml
dependencies:
  custom_router:
    git:
      url: https://github.com/brookesb91/custom_router.git
      ref: master
```

## Usage

### Basic usage

```dart
import 'package:custom_router/custom_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = CustomRouter(
      {
        '/': HomePage.route,
        '/friends': FriendsPage.route,
        '/profile': ProfilePage.route,
      },
      onUnknownRoute: (_) => const Text('Unknown route'),
    );

    return MaterialApp.router(
      routerDelegate: router.delegate,
      routeInformationParser: router.parser,
    );
  }
}
```

### Advanced with splash screen and authorised routes

```dart
import 'package:custom_router/custom_router.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoaded = false;
  bool _isAuthorised = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (!_isLoaded) {
      return SplashPage(onComplete: (authorised) {
        setState(() {
          _isLoaded = true;
          _isAuthorised = authorised;
        });
      });
    }

    final router = CustomRouter(
      _isAuthorised
          ? {
              '/': HomePage.route,
              '/friends': FriendsPage.route,
              '/profile': ProfilePage.route,
            }
          : {
              '/': LoginPage.route,
            },
      onUnknownRoute: (_) => const Text('Unknown route'),
    );

    return MaterialApp.router(
      routerDelegate: router.delegate,
      routeInformationParser: router.parser,
    );
  }
}
```

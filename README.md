# Custom Flutter Router

## Usage

### Basic usage

```dart
import 'package:custom_router/custom_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CustomRouter(
      const {
        '/': HomePage.route,
        '/friends': FriendsPage.route,
        '/profile': ProfilePage.route,
      },
      onUnknownRoute: (_) => const Center(
        child: Text('Unknown route'),
      ),
    );
  }
}
```

### Advanced with splash screen and authorised routes

```dart
import 'package:custom_router/custom_router.dart';

class MyApp extends StatelessWidget {
  bool _isLoaded = false;
  bool _isAuthorised = false;

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return _isLoaded ? CustomRouter(
      _isAuthorised ? {
        '/': HomePage.route,
        '/friends': FriendsPage.route,
        '/profile': ProfilePage.route,
      } : {
        '/': LoginPage.route,
        '/register': RegisterPage.route,
      },
      onUnknownRoute: (_) => const Center(
        child: Text('Unknown route'),
      ),
    ): SplashPage(onComplete: (authorised) {
        _isLoaded = true;
        _isAuthorised = authorised;
      });
  }
}
```

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

### Using the builder method

```dart
return CustomRouter.builder(
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
  builder: (delegate, parser) {
    return MaterialApp.router(
      routerDelegate: delegate,
      routeInformationParser: parser,
    );
  },
);
```

## Navigating

### Using the `RouterLink` widget

```dart
import 'package:custom_router/widgets/router_link.dart';


@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Friends'),
    ),
    body: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        /// Create a router link, passing it the navigation path
        /// and optional query parameters.
        return RouterLink(
          '/profile',
          queryParameters: {'profileId': '$index'},
          /// The builder provides a `go` function which will
          /// initiate the navigation when called.
          builder: (context, go) {
            return ListTile(
              title: Text('Friend $index'),
              onTap: go,
            );
          },
        );
      },
    ),
  );
}
```

## Route State

### Using the `RouterStateBuilder` widget

```dart
static Widget route(BuildContext context) {
  return RouteStateBuilder(builder: (context, state) {
    final profileId = state.queryParameters['profileId'];

    assert(profileId != null, 'profileId is required');

    return ProfilePage(
      profileId: profileId as String,
    );
  });
}
```

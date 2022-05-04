import 'package:custom_router/custom_router.dart';
import 'package:custom_router_demo/pages/friends_page.dart';
import 'package:custom_router_demo/pages/home_page.dart';
import 'package:custom_router_demo/pages/login_page.dart';
import 'package:custom_router_demo/pages/profile_page.dart';
import 'package:custom_router_demo/pages/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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

    return MaterialApp.router(
      routerDelegate: router.delegate,
      routeInformationParser: router.parser,
    );
  }
}

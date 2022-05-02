import 'package:custom_router/custom_router.dart';
import 'package:custom_router_demo/pages/friends_page.dart';
import 'package:custom_router_demo/pages/home_page.dart';
import 'package:custom_router_demo/pages/profile_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final router = CustomRouter(
  {
    '/': HomePage.route,
    '/friends': FriendsPage.route,
    '/profile': ProfilePage.route,
  },
  onUnknownRoute: (_) => const Center(
    child: Text('Unknown route'),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Custom Router Demo',

      /// Assign the router delegate.
      routerDelegate: router.delegate,

      /// Assign the route information parser.
      routeInformationParser: router.parser,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
    );
  }
}

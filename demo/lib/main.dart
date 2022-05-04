import 'package:custom_router/custom_router.dart';
import 'package:custom_router_demo/pages/friends_page.dart';
import 'package:custom_router_demo/pages/home_page.dart';
import 'package:custom_router_demo/pages/profile_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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

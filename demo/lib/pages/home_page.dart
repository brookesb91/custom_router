import 'package:custom_router/widgets/router_link.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static HomePage route(BuildContext context) {
    return const HomePage();
  }

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: RouterLink(
          '/friends',
          builder: (context, go) => ElevatedButton(
            child: const Text('Go to Friends'),
            onPressed: () => go(),
          ),
        ),
      ),
    );
  }
}

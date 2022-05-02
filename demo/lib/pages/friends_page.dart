import 'package:flutter/material.dart';

class FriendsPage extends StatelessWidget {
  static FriendsPage route(BuildContext context) {
    return const FriendsPage();
  }

  const FriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
      ),
      body: const Center(
        child: Text('Friends'),
      ),
    );
  }
}

import 'package:custom_router/widgets/router_link.dart';
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
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return RouterLink(
            '/profile',
            queryParameters: {'profileId': '$index'},
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
}

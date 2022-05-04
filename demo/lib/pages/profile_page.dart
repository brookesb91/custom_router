import 'package:custom_router/custom_router.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String profileId;

  static Widget route(BuildContext context) {
    return RouteStateBuilder(builder: (context, state) {
      final profileId = state.queryParameters['profileId'];

      assert(profileId != null, 'profileId is required');

      return ProfilePage(
        profileId: profileId as String,
      );
    });
  }

  const ProfilePage({Key? key, required this.profileId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile $profileId'),
      ),
      body: Center(
        child: Text('Profile ID: $profileId'),
      ),
    );
  }
}

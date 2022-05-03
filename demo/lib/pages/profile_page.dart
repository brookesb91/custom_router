import 'package:custom_router/custom_router_state.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String profileId;

  static ProfilePage route(BuildContext context) {
    final params = context.router.queryParameters;

    assert(params['profileId'] != null, 'profileId is required');

    return ProfilePage(
      profileId: params['profileId'] as String,
    );
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

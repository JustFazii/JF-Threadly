import 'package:flutter/material.dart';
import 'package:threadly/core/constants/constants.dart';
import 'package:threadly/features/friends/presentation/widgets/friend_list.dart';
import 'package:threadly/features/friends/presentation/widgets/requests_list.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: Constants.defaultPadding,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Text(
                'Requests',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const RequestsList(),
            SliverToBoxAdapter(
              child: Divider(
                height: 50,
                thickness: 3,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SliverToBoxAdapter(
              child: Text(
                'Friends',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            const FriendsList(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threadly/core/screens/loader.dart';
import 'package:threadly/features/auth/providers/auth_provider.dart';

class ProfilePhoto extends ConsumerWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: ref.read(authProvider).getUserInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        if (snapshot.hasData) {
          final user = snapshot.data;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(user!.profilePicUrl),
              ),
            ],
          );
        }

        return Text(snapshot.error.toString());
      },
    );
  }
}

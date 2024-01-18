import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threadly/core/screens/error_screen.dart';
import 'package:threadly/core/screens/loader.dart';
import 'package:threadly/features/auth/providers/get_user_info_provider.dart';

class HomeScreenProfilePicture extends ConsumerWidget {
  const HomeScreenProfilePicture({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(getUserInfoProvider);

    return userInfo.when(
      data: (user) {
        return CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
            user.profilePicUrl,
          ),
        );
      },
      error: (error, stackTrace) {
        return ErrorScreen(error: error.toString());
      },
      loading: () {
        return const Loader();
      },
    );
  }
}

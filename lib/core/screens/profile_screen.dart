import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threadly/features/chat/presentation/screens/chat_screen.dart';
import '/core/constants/extensions.dart';
import '/core/screens/error_screen.dart';
import '/core/screens/loader.dart';
import '/core/widgets/round_button.dart';
import '/features/auth/providers/get_user_info_as_stream_by_id_provider.dart';
import '/features/friends/presentation/widgets/add_friend_button.dart';
import '/features/posts/presentation/widgets/icon_text_button.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({
    super.key,
    this.userId,
  });

  final String? userId;

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myUid = FirebaseAuth.instance.currentUser!.uid;
    final uid = userId ?? myUid;
    final userInfo = ref.watch(getUserInfoAsStreamByIdProvider(uid));

    return userInfo.when(
      data: (user) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Profile Screen'),
              backgroundColor: Theme.of(context).colorScheme.background,
            ),
            backgroundColor: Theme.of(context).colorScheme.background,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.profilePicUrl),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.fullName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 21,
                    ),
                  ),
                  const SizedBox(height: 15),
                  userId == myUid
                      ? _buildDivider()
                      : AddFriendButton(
                          user: user,
                        ),
                  const SizedBox(height: 10),
                  RoundButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        ChatScreen.routeName,
                        arguments: {
                          'userId': userId,
                        },
                      );
                    },
                    label: 'Send Message',
                    color: Theme.of(context).colorScheme.background,
                  ),
                  const SizedBox(height: 20),
                  _buildProfileInfo(
                    email: user.email,
                    gender: user.gender,
                    birthday: user.birthDay,
                  ),
                ],
              ),
            ),
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

  _buildDivider() => const Divider();

  _buildProfileInfo({
    required String email,
    required String gender,
    required DateTime birthday,
  }) =>
      Column(
        children: [
          IconTextButton(
            icon: gender == 'male' ? Icons.male : Icons.female,
            label: gender,
          ),
          const SizedBox(height: 10),
          IconTextButton(
            icon: Icons.cake,
            label: birthday.yMMMEd(),
          ),
          const SizedBox(height: 10),
          IconTextButton(
            icon: Icons.email,
            label: email,
          ),
        ],
      );
}

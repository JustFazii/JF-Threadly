import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threadly/core/screens/loader.dart';
import 'package:threadly/core/widgets/round_button.dart';
import 'package:threadly/features/auth/models/user.dart';
import 'package:threadly/features/friends/providers/friend_provider.dart';

class AddFriendButton extends ConsumerStatefulWidget {
  const AddFriendButton({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  ConsumerState<AddFriendButton> createState() => _AddFriendButtonState();
}

class _AddFriendButtonState extends ConsumerState<AddFriendButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final myUid = FirebaseAuth.instance.currentUser!.uid;
    final requestSent = widget.user.receivedRequests.contains(myUid);
    final requestReceived = widget.user.sentRequests.contains(myUid);
    final alreadyFriend = widget.user.friends.contains(myUid);
    return isLoading
        ? const Loader()
        : RoundButton(
            onPressed: requestReceived
                ? null
                : () async {
                    setState(() => isLoading = true);
                    final provider = ref.read(friendProvider);
                    final userId = widget.user.uid;
                    if (requestSent) {
                      // cancel request
                      await provider.removeFriendRequest(userId: userId);
                    } else if (alreadyFriend) {
                      // remove friendship
                      await provider.removeFriend(userId: userId);
                    } else {
                      // sent friend request
                      await provider.sendFriendReuqest(userId: userId);
                    }
                    setState(() => isLoading = false);
                  },
            label: requestSent
                ? 'Cancel Request'
                : alreadyFriend
                    ? 'Remove Friend'
                    : 'Add Friend',
          );
  }
}

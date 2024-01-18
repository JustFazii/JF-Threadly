import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threadly/core/constants/extensions.dart';
import 'package:threadly/core/screens/error_screen.dart';
import 'package:threadly/core/screens/loader.dart';
import 'package:threadly/features/auth/providers/get_user_info_by_id_provider.dart';
import 'package:threadly/features/posts/models/comment.dart';
import 'package:threadly/features/posts/presentation/widgets/round_like_icon.dart';
import 'package:threadly/features/posts/presentation/widgets/round_profile_tile.dart';
import 'package:threadly/features/posts/providers/posts_provider.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({
    super.key,
    required this.comment,
  });

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Comment header
          CommentHeader(
            comment: comment,
          ),

          // Comment Footer
          CommentFooter(
            comment: comment,
          ),
        ],
      ),
    );
  }
}

class CommentHeader extends ConsumerWidget {
  const CommentHeader({
    super.key,
    required this.comment,
  });

  final Comment comment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userInfo = ref.watch(getUserInfoByIdProvider(comment.authorId));

    return userInfo.when(
      data: (user) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundProfileTile(url: user.profilePicUrl),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.fullName,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      comment.text,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
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

class CommentFooter extends StatelessWidget {
  const CommentFooter({
    super.key,
    required this.comment,
  });

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    final isLiked =
        comment.likes.contains(FirebaseAuth.instance.currentUser!.uid);

    return Consumer(
      builder: (context, ref, child) {
        return Row(
          children: [
            Text(
              comment.createdAt.fromNow(),
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            TextButton(
              onPressed: () async {
                await ref.read(postsProvider).likeDislikeComment(
                      commentId: comment.commentId,
                      likes: comment.likes,
                    );
              },
              child: Text(
                'Like',
                style: TextStyle(
                  color: isLiked
                      ? const Color.fromARGB(255, 28, 42, 71)
                      : Colors.grey.shade500,
                ),
              ),
            ),
            const SizedBox(width: 15),
            const RoundLikeIcon(),
            const SizedBox(width: 5),
            Text(comment.likes.length.toString()),
          ],
        );
      },
    );
  }
}

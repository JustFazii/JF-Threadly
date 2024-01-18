import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threadly/core/widgets/post_info_tile.dart';
import 'package:threadly/features/posts/models/post.dart';
import 'package:threadly/features/posts/presentation/screens/comments_screen.dart';
import 'package:threadly/features/posts/presentation/widgets/icon_text_button.dart';
import 'package:threadly/features/posts/presentation/widgets/post_image_video_view.dart';
import 'package:threadly/features/posts/presentation/widgets/round_like_icon.dart';
import 'package:threadly/features/posts/providers/posts_provider.dart';

class PostTile extends ConsumerWidget {
  const PostTile({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Theme.of(context).colorScheme.onPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostInfoTile(
            datePublished: post.createdAt,
            userId: post.posterId,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              post.content,
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          PostImageVideoView(
            fileUrl: post.fileUrl,
            fileType: post.postType,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 10,
            ),
            child: Column(
              children: [
                PostStats(
                  likes: post.likes,
                ),
                Divider(
                  thickness: 1.0,
                  color: Theme.of(context).colorScheme.primary,
                ),
                PostButtons(post: post),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PostButtons extends ConsumerWidget {
  const PostButtons({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLiked = post.likes.contains(FirebaseAuth.instance.currentUser!.uid);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconTextButton(
          icon: isLiked
              ? FontAwesomeIcons.solidThumbsUp
              : FontAwesomeIcons.thumbsUp,
          color: isLiked
              ? const Color.fromARGB(255, 28, 42, 71)
              : Theme.of(context).colorScheme.primary,
          label: 'Like',
          onPressed: () {
            ref
                .read(postsProvider)
                .likeDislikePost(postId: post.postId, likes: post.likes);
          },
        ),
        IconTextButton(
          icon: FontAwesomeIcons.solidMessage,
          color: Theme.of(context).colorScheme.primary,
          label: 'Comment',
          onPressed: () {
            Navigator.of(context)
                .pushNamed(CommentsScreen.routeName, arguments: post.postId);
          },
        ),
        IconTextButton(
          icon: FontAwesomeIcons.share,
          color: Theme.of(context).colorScheme.primary,
          label: 'Share',
        ),
      ],
    );
  }
}

class PostStats extends StatelessWidget {
  const PostStats({super.key, required this.likes});

  final List<String> likes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const RoundLikeIcon(),
        const SizedBox(width: 5),
        Text('${likes.length}'),
      ],
    );
  }
}

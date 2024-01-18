import 'package:flutter/material.dart';
import 'package:threadly/features/posts/presentation/widgets/comment_text_field.dart';
import 'package:threadly/features/posts/presentation/widgets/comments_list.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({
    super.key,
    required this.postId,
  });

  final String postId;

  static const routeName = '/comments';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text('Comments'),
      ),
      body: Column(
        children: [
          // Comments List
          CommentsList(postId: postId),

          // Comment Text field
          CommentTextField(
            postId: postId,
          ),
        ],
      ),
    );
  }
}

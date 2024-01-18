import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threadly/features/posts/providers/posts_provider.dart';

class CommentTextField extends ConsumerStatefulWidget {
  const CommentTextField({
    super.key,
    required this.postId,
  });

  final String postId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CommentTextFieldState();
}

class _CommentTextFieldState extends ConsumerState<CommentTextField> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> makeComment() async {
    final text = controller.text.trim();
    controller.clear();
    await ref.read(postsProvider).makeComment(
          text: text,
          postId: widget.postId,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.only(
          left: 15,
        ),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
            )),
        child: TextField(
          controller: controller,
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
          ),
          decoration: InputDecoration(
            hintText: 'Write your comment...',
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: makeComment,
              icon: const Icon(Icons.send),
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ),
      ),
    );
  }
}

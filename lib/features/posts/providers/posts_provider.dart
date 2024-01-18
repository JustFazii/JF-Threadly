import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threadly/features/posts/repository/post_repository.dart';

final postsProvider = Provider((ref) {
  return PostRepository();
});

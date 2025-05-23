import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threadly/core/constants/firebase_collection_names.dart';
import 'package:threadly/core/constants/firebase_field_names.dart';
import 'package:threadly/features/posts/models/comment.dart';

final getAllCommentsProvider = StreamProvider.autoDispose
    .family<Iterable<Comment>, String>((ref, String postId) {
  final controller = StreamController<Iterable<Comment>>();

  final sub = FirebaseFirestore.instance
      .collection(FirebaseCollectionNames.comments)
      .where(FirebaseFieldNames.postId, isEqualTo: postId)
      .orderBy(FirebaseFieldNames.createdAt, descending: true)
      .snapshots()
      .listen((snapshot) {
    final comments = snapshot.docs.map(
      (commentData) => Comment.fromMap(
        commentData.data(),
      ),
    );
    controller.sink.add(comments);
  });

  ref.onDispose(() {
    sub.cancel();
    controller.close();
  });

  return controller.stream;
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threadly/features/auth/repository/auth_repository.dart';

final authProvider = Provider((ref) {
  return AuthRepository();
});

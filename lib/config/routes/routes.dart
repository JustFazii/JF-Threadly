import 'package:flutter/cupertino.dart';
import 'package:threadly/features/auth/presentations/screens/create_account_screen.dart';
import 'package:threadly/features/auth/presentations/screens/login_screens.dart';
import 'package:threadly/features/chat/presentation/screens/chat_screen.dart';
import 'package:threadly/features/chat/presentation/screens/chats_screen.dart';

import '/core/screens/error_screen.dart';
import '/core/screens/home_screen.dart';
import '/core/screens/profile_screen.dart';
import '/features/posts/presentation/screens/comments_screen.dart';
import '/features/posts/presentation/screens/create_post_screen.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return _cupertinoRoute(
          const LoginScreen(),
        );
      case CreateAccountScreen.routeName:
        return _cupertinoRoute(
          const CreateAccountScreen(),
        );
      case HomeScreen.routeName:
        return _cupertinoRoute(
          const HomeScreen(),
        );
      case CreatePostScreen.routeName:
        return _cupertinoRoute(
          const CreatePostScreen(),
        );
      case CommentsScreen.routeName:
        final postId = settings.arguments as String;
        return _cupertinoRoute(
          CommentsScreen(postId: postId),
        );
      case ProfileScreen.routeName:
        final userId = settings.arguments as String;
        return _cupertinoRoute(
          ProfileScreen(
            userId: userId,
          ),
        );
      case ChatScreen.routeName:
        final arguments = settings.arguments as Map<String, dynamic>;
        final userId = arguments['userId'] as String;
        return _cupertinoRoute(
          ChatScreen(
            userId: userId,
          ),
        );
      case ChatsScreen.routeName:
        return _cupertinoRoute(
          const ChatsScreen(),
        );
      default:
        return _cupertinoRoute(
          ErrorScreen(
            error: 'Wrong Route provided ${settings.name}',
          ),
        );
    }
  }

  static Route _cupertinoRoute(Widget view) => CupertinoPageRoute(
        builder: (_) => view,
      );

  Routes._();
}

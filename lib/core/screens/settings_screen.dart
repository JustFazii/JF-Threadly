import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:threadly/features/auth/presentations/widgets/login_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, this.userId});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  final String? userId;

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 150),
          child: LoginButton(onPressed: signUserOut, label: 'Sign out'),
        ),
      ),
    );
  }
}

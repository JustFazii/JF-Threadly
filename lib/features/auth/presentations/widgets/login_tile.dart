import 'package:flutter/material.dart';

class LoginTile extends StatelessWidget {
  final String imagePath;

  const LoginTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.background),
        borderRadius: BorderRadius.circular(50),
        color: Theme.of(context).colorScheme.background,
      ),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}

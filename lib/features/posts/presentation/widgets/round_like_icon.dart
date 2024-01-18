import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundLikeIcon extends StatelessWidget {
  const RoundLikeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: FaIcon(
        FontAwesomeIcons.thumbsUp,
        color: Theme.of(context).colorScheme.background,
        size: 12,
      ),
    );
  }
}

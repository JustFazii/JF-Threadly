import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color = const Color.fromARGB(255, 28, 42, 71),
  });

  final VoidCallback? onPressed;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: onPressed == null ? Colors.transparent : color,
        ),
        child: Center(
            child: Text(
          label,
          style: TextStyle(
            color: (color == const Color.fromARGB(255, 28, 42, 71) &&
                    onPressed != null)
                ? Colors.white
                : Theme.of(context).colorScheme.primary,
            fontSize: 18,
          ),
        )),
      ),
    );
  }
}

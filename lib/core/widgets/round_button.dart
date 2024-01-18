import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color = const Color.fromARGB(255, 28, 42, 71),
    this.height = 50,
  });

  final VoidCallback? onPressed;
  final String label;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: onPressed == null ? Colors.transparent : color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Center(
            child: Text(
          label,
          style: TextStyle(
            color: (color == Theme.of(context).colorScheme.primary &&
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

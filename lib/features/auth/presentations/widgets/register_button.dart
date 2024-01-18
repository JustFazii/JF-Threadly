import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color = const Color.fromARGB(255, 28, 42, 71),
    this.height = 75,
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
        width: 75,
        decoration: BoxDecoration(
          color: onPressed == null ? Colors.transparent : color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Center(
            child: Text(
          label,
          style: TextStyle(
            color: (color == Colors.white && onPressed != null)
                ? Colors.white
                : Colors.white,
            fontSize: 18,
          ),
        )),
      ),
    );
  }
}

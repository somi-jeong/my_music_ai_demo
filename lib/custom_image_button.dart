import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomImageButton extends StatefulWidget {
  final VoidCallback onTap;
  final String label;

  const CustomImageButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  @override
  State<CustomImageButton> createState() => _CustomImageButtonState();
}

class _CustomImageButtonState extends State<CustomImageButton> {
  bool _isPressed = false;

  void _setPressed(bool value) {
    setState(() {
      _isPressed = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => _setPressed(true),
      onTapUp: (_) => _setPressed(false),
      onTapCancel: () => _setPressed(false),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            _isPressed ? 'assets/green_button.png' : 'assets/yellow_button.png',
            width: 250,
          ),
          Text(
            widget.label,
            style: GoogleFonts.delius(
              fontSize: 24,
              fontWeight: FontWeight.normal,
              color: Colors.black,
              shadows: [
                Shadow(
                  offset: Offset(1, 1),
                  blurRadius: 2,
                  color: Colors.black38,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;  // Cambié esto para aceptar null
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;
  final bool enable;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.icon,
    required this.enable,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: enable ? onPressed : null,  // Deshabilita el botón si 'enable' es false
      icon: icon != null ? Icon(icon) : Container(), // Icono opcional
      label: Text(
        text,
        style: TextStyle(color: enable ? textColor : Colors.grey), // Cambiar color de texto si está deshabilitado
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: enable ? backgroundColor : Colors.grey,  // Cambiar color de fondo si está deshabilitado
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

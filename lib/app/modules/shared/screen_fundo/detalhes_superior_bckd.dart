import 'package:flutter/material.dart';

class DetalhesSuperiorBckd extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(10,
        size.height - 140); // Linha reta até perto do canto inferior esquerdo
    path.quadraticBezierTo(size.width / 4, size.height, size.width,
        size.height - 250); // Curva quadrática para criar a forma da curva
    path.lineTo(size.width, 0); // Linha reta de volta ao topo
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

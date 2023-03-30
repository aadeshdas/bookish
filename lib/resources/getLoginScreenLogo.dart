import 'package:flutter/material.dart';

Image getLoginScreenLogo(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 200.0,
  );
}
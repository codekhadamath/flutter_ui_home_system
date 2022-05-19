import 'package:flutter/material.dart';

class Space {
  static verticle({ double value = 8.0 }) => SizedBox(
        height: value,
      );

  static horizontal({ double value = 8.0 }) => SizedBox(
        width: value,
      );
}

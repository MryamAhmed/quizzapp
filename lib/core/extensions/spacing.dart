import 'package:flutter/material.dart';

extension Spacing on num {
  SizedBox get vertical => SizedBox(height: toDouble());

  SizedBox get horizontal => SizedBox(width: toDouble());
}

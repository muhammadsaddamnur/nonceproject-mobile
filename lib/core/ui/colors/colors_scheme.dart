import 'package:flutter/material.dart';

@immutable
class ColorsScheme extends ThemeExtension<ColorsScheme> {
  const ColorsScheme({
    required this.success,
    required this.info,
    required this.warning,
    required this.danger,
  });
  final Color? success;
  final Color? info;
  final Color? warning;
  final Color? danger;
  @override
  ColorsScheme copyWith({
    Color? success,
    Color? info,
    Color? warning,
    Color? danger,
  }) {
    return ColorsScheme(
      success: success ?? this.success,
      info: info ?? this.info,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
    );
  } // Controls how the properties change on theme changes

  @override
  ColorsScheme lerp(ThemeExtension<ColorsScheme>? other, double t) {
    if (other is! ColorsScheme) {
      return this;
    }
    return ColorsScheme(
      success: Color.lerp(success, other.success, t),
      info: Color.lerp(info, other.info, t),
      warning: Color.lerp(warning, other.warning, t),
      danger: Color.lerp(danger, other.danger, t),
    );
  } // Controls how it displays when the instance is being passed

  // to the `print()` method.
  @override
  String toString() => 'CustomColors('
      'success: $success, info: $info, warning: $info, danger: $danger'
      ')'; // the light theme
  static const light = ColorsScheme(
    success: Color(0xff28a745),
    info: Color(0xff17a2b8),
    warning: Color(0xffffc107),
    danger: Color(0xffdc3545),
  ); // the dark theme
  static const dark = ColorsScheme(
    success: Color(0xff00bc8c),
    info: Color(0xff17a2b8),
    warning: Color(0xfff39c12),
    danger: Color(0xffe74c3c),
  );
}

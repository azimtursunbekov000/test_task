import 'package:flutter/material.dart';
import 'package:test_task/internal/theme/theme_helper.dart';

abstract class TextHelper {
  static TextStyle nunitoS12w500 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: ThemeHelper.white,
    fontFamily: 'Nunito',
  );

  static TextStyle nunitoS11w400 = const TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: ThemeHelper.black,
    fontFamily: 'Nunito',
  );

  static TextStyle nunitoS16w800 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w800,
    color: ThemeHelper.black,
    fontFamily: 'Nunito',
  );

  static TextStyle nunitoS18w700 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: ThemeHelper.grey2,
    fontFamily: 'Nunito',
  );


}

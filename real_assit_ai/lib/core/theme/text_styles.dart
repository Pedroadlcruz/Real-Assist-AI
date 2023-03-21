// ignore_for_file: avoid_classes_with_only_static_members

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_assit_ai/core/extensions/responsive.dart';
import 'package:real_assit_ai/core/theme/app_colors.dart';

///
/// All App custom [TextStyle]
///
class TextStyles {
  /// fontSize [24], fontWeight[700], text color[Primary]
  static TextStyle boldHuge24 = GoogleFonts.manrope(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w700,
    fontSize: 24.fS,
  );

  /// fontSize [14], fontWeight[700], text color[Primary]
  static TextStyle boldSmall14 = GoogleFonts.manrope(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w700,
    fontSize: 14.fS,
  );

  /// fontSize [18], fontWeight[700], text color[Primary]
  static TextStyle boldLarge18 = GoogleFonts.manrope(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w700,
    fontSize: 18.fS,
  );

  /// fontSize [12], fontWeight[400], text color[Gray]
  static TextStyle tiny12 = GoogleFonts.manrope(
    color: AppColors.color9BA1AE,
    fontWeight: FontWeight.w400,
    fontSize: 12.fS,
  );

  /// fontSize [14.38], fontWeight[500], text color[Gray]
  static TextStyle hintText = GoogleFonts.manrope(
    color: AppColors.color9BA1AE,
    fontWeight: FontWeight.w500,
    fontSize: 14.38.fS,
  );
}

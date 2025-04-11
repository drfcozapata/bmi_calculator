import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';

class ButtonStyles {
  static ButtonStyle finalButton = ButtonStyle(
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    backgroundColor: WidgetStatePropertyAll(AppColors.backgroundComponent),
  );
}

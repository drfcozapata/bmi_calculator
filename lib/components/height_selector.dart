import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  const HeightSelector({super.key});

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  double height = 170;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundComponent,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.only(top: 16, bottom: 4, left: 16, right: 16),
        child: Column(
          children: [
            Text('Altura'.toUpperCase(), style: TextStyles.bodyText),
            Text('${height.toStringAsFixed(0)} cm', style: TextStyles.bigText),
            Slider(
              value: height,
              onChanged: (newValue) {
                setState(() {
                  height = newValue;
                });
              },
              min: 140,
              max: 210,
              divisions: 60,
              activeColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}

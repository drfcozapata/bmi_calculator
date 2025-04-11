import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final double selectedHeight;
  final Function(double) onHeightChange;

  const HeightSelector({
    super.key,
    required this.selectedHeight,
    required this.onHeightChange,
  });

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
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
            Text(
              '${widget.selectedHeight.toStringAsFixed(0)} cm',
              style: TextStyles.bigText,
            ),
            Slider(
              value: widget.selectedHeight,
              onChanged: (newHeight) {
                widget.onHeightChange(newHeight);
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

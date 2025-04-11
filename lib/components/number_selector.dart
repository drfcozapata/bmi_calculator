import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/text_styles.dart';

class NumberSelector extends StatefulWidget {
  final String title;
  final int value;
  final Function() onIncrement;
  final Function() onDecrement;

  const NumberSelector({
    super.key,
    required this.title,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  State<NumberSelector> createState() => _NumberSelectorState();
}

class _NumberSelectorState extends State<NumberSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundComponent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(widget.title, style: TextStyles.bodyText),
            Text(widget.value.toString(), style: TextStyles.bigText),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    widget.onDecrement();
                  },
                  shape: CircleBorder(),
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.remove, color: Colors.white, size: 38),
                ),
                SizedBox(width: 16),
                FloatingActionButton(
                  heroTag: null,
                  onPressed: () {
                    widget.onIncrement();
                  },
                  shape: CircleBorder(),
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.add, color: Colors.white, size: 38),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

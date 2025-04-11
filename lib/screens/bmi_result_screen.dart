import 'package:flutter/material.dart';
import 'package:imc_calculator/core/app_colors.dart';
import 'package:imc_calculator/core/button_styles.dart';
import 'package:imc_calculator/core/text_styles.dart';

class BmiResultScreen extends StatelessWidget {
  final double height;
  final int weight;

  const BmiResultScreen({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarResult(),
      backgroundColor: AppColors.background,
      body: bodyResult(context),
    );
  }

  Padding bodyResult(BuildContext context) {
    double result = weight / ((height / 100) * (height / 100));
    String bmiResult = result.toStringAsFixed(2);
    String interpretation = 'no se pudo calcular el IMC.';
    String range = 'Normal';

    switch (result) {
      case (< 18.5):
        interpretation = 'tienes BAJO PESO.';
        range = 'Bajo Peso';
      case (>= 18.5 && < 25.0):
        interpretation = 'tu IMC es NORMAL.';
        range = 'Normal';
      case (>= 25.0 && < 30.0):
        interpretation = 'tu IMC se encuentra en rango de SOBREPESO.';
        range = 'Sobrepeso';
      case (>= 30.0 && < 35.0):
        interpretation = 'tu IMC se encuentra en rango de OBESIDAD I.';
        range = 'Obesidad I';
      case (>= 35.0 && < 40.0):
        interpretation = 'tu IMC se encuentra en rango de OBESIDAD II.';
        range = 'Obesidad II';
      case (>= 40.0):
        interpretation = 'tu IMC se encuentra en rango de OBESIDAD III.';
        range = 'Obesidad III';
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Tu resultado:', style: TextStyles.bigText),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      range.toUpperCase(),
                      style: TextStyle(
                        color: getColorByBmi(result),
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    Text(bmiResult, style: TextStyles.bigResult),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Según ese resultado, puede decirse que $interpretation',
                        style: TextStyles.bodyText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 70,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyles.finalButton,
                child: Text(
                  'Finalizar'.toUpperCase(),
                  style: TextStyles.calculateText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBarResult() {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      title: Text('Calculadora de IMC'),
    );
  }

  Color getColorByBmi(double result) {
    return switch (result) {
      < 18.5 => Colors.blue,
      >= 18.5 && < 25.0 => Colors.green,
      >= 25.0 && < 30.0 => Colors.amber,
      >= 30.0 => Colors.red,
      double() => throw UnimplementedError(),
    };
  }
}

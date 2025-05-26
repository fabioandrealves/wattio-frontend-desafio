import 'package:desafio_frontend_wattio/ui/style/percentage_extension.dart';
import 'package:flutter/material.dart';

import '../style/text_styles.dart';

class EnergyAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const EnergyAppButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return SizedBox(
      width: screenSize.width * 85.00.percent(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.energyAppButtonTextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

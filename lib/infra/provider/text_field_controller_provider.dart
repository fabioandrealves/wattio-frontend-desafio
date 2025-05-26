import 'package:flutter/cupertino.dart';

class TextFieldControllerProvider extends ChangeNotifier {
  final TextEditingController controller;

  TextFieldControllerProvider(double initialValue)
    : controller = TextEditingController(text: initialValue.toStringAsFixed(0));

  void updateText(double novoValor) {
    controller.text = novoValor.toStringAsFixed(0);
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

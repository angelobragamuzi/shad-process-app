import 'package:flutter/services.dart';

class OabInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    String text = newValue.text.replaceAll(' ', '');

    if (text.length > 9) {
      text = text.substring(0, 9);
    }

    if (!text.contains('/') && text.length > 6) {
      text = '${text.substring(0, 6)}/${text.substring(6)}';
    }

    return TextEditingValue(
      text: text.toUpperCase(),
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

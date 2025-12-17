import 'package:flutter/services.dart';

class ProcessNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();

    for (int i = 0; i < digits.length && i < 20; i++) {
      buffer.write(digits[i]);

      if (i == 6) buffer.write('-');
      if (i == 8) buffer.write('.');
      if (i == 12) buffer.write('.');
      if (i == 13) buffer.write('.');
      if (i == 15) buffer.write('.');
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

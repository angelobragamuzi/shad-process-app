import 'package:flutter/services.dart';

class CpfCnpjFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();

    if (digits.length <= 11) {
      // CPF
      for (int i = 0; i < digits.length && i < 11; i++) {
        buffer.write(digits[i]);
        if (i == 2 || i == 5) buffer.write('.');
        if (i == 8) buffer.write('-');
      }
    } else {
      // CNPJ
      for (int i = 0; i < digits.length && i < 14; i++) {
        buffer.write(digits[i]);
        if (i == 1 || i == 4) buffer.write('.');
        if (i == 7) buffer.write('/');
        if (i == 11) buffer.write('-');
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

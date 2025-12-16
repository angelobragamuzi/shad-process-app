import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CreateProcessDialog extends StatelessWidget {
  const CreateProcessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      backgroundColor: Color.fromARGB(255, 29, 29, 29),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Registrar Novo Processo",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadprocess/src/modules/home/widgets/create-process/create_process_dialog.dart';

class CreateProcessButton extends StatelessWidget {
  const CreateProcessButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ShadButton.outline(
          hoverBackgroundColor: Colors.grey.withOpacity(0.3),
          onPressed: () {
            showShadDialog(
              context: context,
              builder: (context) => const CreateProcessDialog(),
            );
          },
          child: Text(
            "Criar Novo Processo",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

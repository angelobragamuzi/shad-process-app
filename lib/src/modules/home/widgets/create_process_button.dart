// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shadprocess/src/modules/process/widgets/page-view/process_page_view_screen.dart';

class CreateProcessButton extends StatelessWidget {
  const CreateProcessButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00D1FF),
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProcessPageViewScreen()),
        ),
        icon: const Icon(
          Icons.add_rounded,
          size: 20,
          fontWeight: FontWeight.bold,
        ),
        label: const Text(
          "CRIAR NOVO PROCESSO",
          style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1),
        ),
      ),
    );
  }
}

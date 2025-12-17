// ignore_for_file: deprecated_member_use, unused_field

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shadprocess/src/core/controllers/case_form_controller.dart';
import 'package:shadprocess/src/dependencies.dart';

class CaseFormStepTwo extends StatefulWidget {
  final PageController pageController;
  const CaseFormStepTwo({super.key, required this.pageController});

  @override
  State<CaseFormStepTwo> createState() => _CaseFormStepTwoState();
}

class _CaseFormStepTwoState extends State<CaseFormStepTwo> {
  final _formKey = GlobalKey<FormState>();

  DateTime _lastMovementDate = DateTime.now();
  DateTime _nextDeadline = DateTime.now().add(const Duration(days: 7));
  DateTime? _hearingDate;
  DateTime _movementDate = DateTime.now();

  final _deadlineDescriptionCtrl = TextEditingController();
  final _hearingTypeCtrl = TextEditingController();
  final _movementDescriptionCtrl = TextEditingController();
  final _movementResponsibleCtrl = TextEditingController();

  late final CaseFormController _controller;
  bool _isSaving = false;

  static const _bgScaffold = Color(0xFF0F1113);
  static const _cardBg = Color(0xFF1A1D21);
  static const _inputBg = Color(0xFF25282C);
  static const _borderColor = Colors.white10;
  static const _accentBlue = Color(0xFF00D1FF);
  static const _textSub = Color(0xFF8A8F98);

  @override
  void initState() {
    super.initState();
    _controller = getIt<CaseFormController>();
  }

  InputDecoration _decoration(String label) => InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: _textSub, fontSize: 13),
    floatingLabelStyle: const TextStyle(
      color: _accentBlue,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
    filled: true,
    fillColor: _inputBg,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 16,
    ), // Aumentado
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: _borderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: _accentBlue, width: 1.5),
    ),
  );

  Widget _section(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: _accentBlue,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _buildLargeDateTile(String label, DateTime date, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ), // Aumentado
          decoration: BoxDecoration(
            color: _inputBg.withOpacity(0.6),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(color: _textSub, fontSize: 10),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 13,
                    color: _accentBlue,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    DateFormat('dd/MM/yy').format(date),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgScaffold,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _section('Prazos do Processo', [
                        Row(
                          children: [
                            _buildLargeDateTile(
                              'Última Mov.',
                              _lastMovementDate,
                              () => _pickDate(
                                initial: _lastMovementDate,
                                onSelect: (d) => _lastMovementDate = d,
                              ),
                            ),
                            const SizedBox(width: 10),
                            _buildLargeDateTile(
                              'Próximo Prazo',
                              _nextDeadline,
                              () => _pickDate(
                                initial: _nextDeadline,
                                onSelect: (d) => _nextDeadline = d,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _deadlineDescriptionCtrl,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          decoration: _decoration('Descrição do prazo'),
                          validator: (v) =>
                              v?.isEmpty ?? true ? 'Obrigatório' : null,
                        ),
                      ]),

                      _section('Audiência', [
                        Row(
                          children: [
                            _buildLargeDateTile(
                              'Data da Audiência',
                              _hearingDate ?? DateTime.now(),
                              () => _pickDate(
                                initial: _hearingDate ?? DateTime.now(),
                                onSelect: (d) => _hearingDate = d,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: _hearingTypeCtrl,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                decoration: _decoration('Tipo (Opcional)'),
                              ),
                            ),
                          ],
                        ),
                      ]),

                      _section('Movimentação Inicial', [
                        Row(
                          children: [
                            _buildLargeDateTile(
                              'Data Mov.',
                              _movementDate,
                              () => _pickDate(
                                initial: _movementDate,
                                onSelect: (d) => _movementDate = d,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: _movementResponsibleCtrl,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                decoration: _decoration('Responsável'),
                                validator: (v) =>
                                    v?.isEmpty ?? true ? 'Obrigatório' : null,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _movementDescriptionCtrl,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          decoration: _decoration('Descrição da Movimentação'),
                          validator: (v) =>
                              v?.isEmpty ?? true ? 'Obrigatório' : null,
                        ),
                      ]),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 4),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 55, // Aumentado
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: _borderColor),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () => widget.pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            ),
                            child: const Text(
                              'VOLTAR',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: 55, // Aumentado
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _accentBlue,
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: _isSaving ? null : _saveAndFinish,
                            child: _isSaving
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                      color: Colors.black,
                                    ),
                                  )
                                : const Text(
                                    'SALVAR E CONTINUAR',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 13,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickDate({
    required DateTime initial,
    required Function(DateTime) onSelect,
  }) async {
    final date = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) => Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: _accentBlue,
            onPrimary: Colors.black,
            surface: _cardBg,
          ),
        ),
        child: child!,
      ),
    );
    if (date != null) {
      onSelect(date);
      setState(() {});
    }
  }

  Future<void> _saveAndFinish() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);
    try {
      await _controller.saveStepTwo(
        lastMovementDate: _lastMovementDate,
        nextDeadline: _nextDeadline,
        deadlineDescription: _deadlineDescriptionCtrl.text,
        hearingDate: _hearingDate,
        hearingType: _hearingTypeCtrl.text.isEmpty
            ? null
            : _hearingTypeCtrl.text,
        movementDate: _movementDate,
        movementDescription: _movementDescriptionCtrl.text,
        movementResponsible: _movementResponsibleCtrl.text,
      );
      if (!mounted) return;
      widget.pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }
}

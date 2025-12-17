// ignore_for_file: deprecated_member_use, unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:shadprocess/src/core/controllers/case_form_controller.dart';
import 'package:shadprocess/src/dependencies.dart';
import 'package:shadprocess/src/modules/process/widgets/format/cpf_formatter.dart';
import 'package:shadprocess/src/modules/process/widgets/format/process_number_formatter.dart';

class CaseFormStepOne extends StatefulWidget {
  final PageController pageController;
  const CaseFormStepOne({super.key, required this.pageController});

  @override
  State<CaseFormStepOne> createState() => _CaseFormStepOneState();
}

class _CaseFormStepOneState extends State<CaseFormStepOne> {
  final _formKey = GlobalKey<FormState>();

  final _caseNumberCtrl = TextEditingController();
  final _areaCtrl = TextEditingController();
  final _courtCtrl = TextEditingController();
  final _jurisdictionCtrl = TextEditingController();
  final _mainPartyNameCtrl = TextEditingController();
  final _mainPartyRoleCtrl = TextEditingController();
  final _mainPartyTaxCtrl = TextEditingController();
  final _opposingPartyNameCtrl = TextEditingController();
  final _opposingPartyTaxCtrl = TextEditingController();

  String _caseType = 'Judicial';
  String _status = 'Em andamento';
  String _priority = 'Média';
  DateTime _startDate = DateTime.now();
  DateTime? _expectedEndDate;

  static const _bgScaffold = Color(0xFF0F1113);
  static const _cardBg = Color(0xFF1A1D21);
  static const _inputBg = Color(0xFF25282C);
  static const _borderColor = Colors.white10;
  static const _accentBlue = Color(0xFF00D1FF);
  static const _textSub = Color(0xFF8A8F98);

  late final CaseFormController _controller;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _controller = getIt<CaseFormController>();
  }

  InputDecoration _decoration(String label) => InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: _textSub, fontSize: 12),
    floatingLabelStyle: const TextStyle(
      color: _accentBlue,
      fontWeight: FontWeight.bold,
    ),
    filled: true,
    fillColor: _inputBg,
    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
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
      borderSide: const BorderSide(color: _accentBlue, width: 1.2),
    ),
  );

  Widget _section(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
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
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: _accentBlue,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }

  Widget _buildDateBtn(String label, DateTime date, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: _inputBg,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: _borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(color: _textSub, fontSize: 10),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    size: 12,
                    color: _accentBlue,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    DateFormat('dd/MM/yy').format(date),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _section('Processo', [
                        TextFormField(
                          controller: _caseNumberCtrl,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            ProcessNumberFormatter(),
                          ],
                          decoration: _decoration('Número do processo'),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _caseType,
                                dropdownColor: _cardBg,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                decoration: _decoration('Tipo'),
                                items:
                                    [
                                          'Judicial',
                                          'Administrativo',
                                          'Trabalhista',
                                          'Cível',
                                        ]
                                        .map(
                                          (e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          ),
                                        )
                                        .toList(),
                                onChanged: (v) =>
                                    setState(() => _caseType = v!),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                controller: _areaCtrl,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                decoration: _decoration('Área'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _courtCtrl,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                decoration: _decoration('Tribunal'),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                controller: _jurisdictionCtrl,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                decoration: _decoration('Comarca'),
                              ),
                            ),
                          ],
                        ),
                      ]),

                      _section('Status & Datas', [
                        Row(
                          children: [
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _status,
                                dropdownColor: _cardBg,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                decoration: _decoration('Status'),
                                items: ['Em andamento', 'Suspenso', 'Encerrado']
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (v) => setState(() => _status = v!),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: DropdownButtonFormField<String>(
                                value: _priority,
                                dropdownColor: _cardBg,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                decoration: _decoration('Prioridade'),
                                items: ['Baixa', 'Média', 'Alta']
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (v) =>
                                    setState(() => _priority = v!),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _buildDateBtn(
                              'Início',
                              _startDate,
                              () => _pickDate(
                                initial: _startDate,
                                onSelect: (d) => _startDate = d,
                              ),
                            ),
                            const SizedBox(width: 8),
                            _buildDateBtn(
                              'Término',
                              _expectedEndDate ?? DateTime.now(),
                              () => _pickDate(
                                initial: DateTime.now(),
                                onSelect: (d) => _expectedEndDate = d,
                              ),
                            ),
                          ],
                        ),
                      ]),

                      _section('Parte Principal', [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _mainPartyNameCtrl,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                decoration: _decoration('Nome'),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextFormField(
                                controller: _mainPartyRoleCtrl,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                decoration: _decoration('Papel'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _mainPartyTaxCtrl,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                          decoration: _decoration('CPF/CNPJ'),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfCnpjFormatter(),
                          ],
                        ),
                      ]),

                      _section('Parte Contrária', [
                        TextFormField(
                          controller: _opposingPartyNameCtrl,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                          decoration: _decoration('Nome Contrário'),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _opposingPartyTaxCtrl,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                          decoration: _decoration('CPF/CNPJ Contrário'),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CpfCnpjFormatter(),
                          ],
                        ),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _accentBlue,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _isSaving ? null : _saveCase,
                    child: _isSaving
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.black,
                            ),
                          )
                        : const Text(
                            'SALVAR E CONTINUAR',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                          ),
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

  Future<void> _saveCase() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);
    try {
      await _controller.saveStepOne(
        caseNumber: _caseNumberCtrl.text,
        caseType: _caseType,
        area: _areaCtrl.text,
        court: _courtCtrl.text,
        jurisdiction: _jurisdictionCtrl.text,
        status: _status,
        priority: _priority,
        startDate: _startDate,
        expectedEndDate: _expectedEndDate,
        mainPartyName: _mainPartyNameCtrl.text,
        mainPartyRole: _mainPartyRoleCtrl.text,
        mainPartyTaxId: _mainPartyTaxCtrl.text,
        opposingPartyName: _opposingPartyNameCtrl.text,
        opposingPartyTaxId: _opposingPartyTaxCtrl.text,
      );
      if (!mounted) return;
      widget.pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }
}

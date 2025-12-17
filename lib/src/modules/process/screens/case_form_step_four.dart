// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:shadprocess/src/core/controllers/case_form_controller.dart';

import 'package:shadprocess/src/dependencies.dart';

class CaseFormStepFour extends StatefulWidget {
  final PageController pageController;

  const CaseFormStepFour({super.key, required this.pageController});

  @override
  State<CaseFormStepFour> createState() => _CaseFormStepFourState();
}

class _CaseFormStepFourState extends State<CaseFormStepFour> {
  final _formKey = GlobalKey<FormState>();

  final _descriptionCtrl = TextEditingController();

  final _responsibleCtrl = TextEditingController();

  DateTime _movementDate = DateTime.now();

  late final CaseFormController _controller;

  bool _isSaving = false;

  // Design System Consistente

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

  InputDecoration _decoration(String label, {IconData? icon}) =>
      InputDecoration(
        labelText: label,

        labelStyle: const TextStyle(color: _textSub, fontSize: 14),

        floatingLabelStyle: const TextStyle(
          color: _accentBlue,

          fontWeight: FontWeight.bold,
        ),

        filled: true,

        fillColor: _inputBg,

        prefixIcon: icon != null ? Icon(icon, size: 18, color: _textSub) : null,

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,

          vertical: 18,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),

          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),

          borderSide: const BorderSide(color: _borderColor),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),

          borderSide: const BorderSide(color: _accentBlue, width: 1.5),
        ),
      );

  Widget _section(String title, List<Widget> children) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: _cardBg,

        borderRadius: BorderRadius.circular(20),

        border: Border.all(color: _borderColor),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            title.toUpperCase(),

            style: const TextStyle(
              fontSize: 11,

              fontWeight: FontWeight.bold,

              color: _textSub,

              letterSpacing: 1.5,
            ),
          ),

          const SizedBox(height: 18),

          ...children,
        ],
      ),
    );
  }

  Widget _buildDateTile(String title, String value, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,

      borderRadius: BorderRadius.circular(12),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,

                  style: const TextStyle(color: _textSub, fontSize: 12),
                ),

                const SizedBox(height: 4),

                Text(
                  value,

                  style: const TextStyle(
                    color: Colors.white,

                    fontSize: 15,

                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const Icon(
              Icons.calendar_month_outlined,

              color: _accentBlue,

              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,

      initialDate: _movementDate,

      firstDate: DateTime(2000),

      lastDate: DateTime(2100),

      builder: (context, child) => Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: _accentBlue,

            onPrimary: Colors.black,

            surface: _cardBg,
          ),

          dialogBackgroundColor: _bgScaffold,
        ),

        child: child!,
      ),
    );

    if (date != null) setState(() => _movementDate = date);
  }

  Future<void> _saveAndFinish() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      debugPrint('📌 [STEP 4] Adicionando movimentação final');

      await _controller.addMovement(
        movementDate: _movementDate,

        description: _descriptionCtrl.text,

        responsible: _responsibleCtrl.text,
      );

      debugPrint('📦 [FINAL] Salvando processo completo no banco');

      await _controller.saveAllToDatabase();

      debugPrint('✅ [SUCCESS] Processo salvo com sucesso');

      if (!mounted) return;

      Navigator.pop(context);
    } catch (e, s) {
      debugPrint('❌ [ERROR] Falha ao salvar processo');

      debugPrint(e.toString());

      debugPrintStack(stackTrace: s);
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.white, fontSize: 15);

    return Scaffold(
      backgroundColor: _bgScaffold,

      body: Form(
        key: _formKey,

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              _section('Últimos Detalhes', [
                _buildDateTile(
                  'Data da movimentação',

                  DateFormat('dd/MM/yyyy').format(_movementDate),

                  _pickDate,
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: _descriptionCtrl,

                  style: textStyle,

                  decoration: _decoration(
                    'Descrição da Movimentação',

                    icon: Icons.history_edu_rounded,
                  ),

                  validator: (v) =>
                      v == null || v.isEmpty ? 'Informe a descrição' : null,
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: _responsibleCtrl,

                  style: textStyle,

                  decoration: _decoration(
                    'Responsável',

                    icon: Icons.person_outline,
                  ),

                  validator: (v) =>
                      v == null || v.isEmpty ? 'Informe o responsável' : null,
                ),
              ]),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 55,

                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: _borderColor),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
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

                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: SizedBox(
                      height: 55,

                      child: ElevatedButton.icon(
                        icon: _isSaving
                            ? const SizedBox(
                                width: 18,

                                height: 18,

                                child: CircularProgressIndicator(
                                  strokeWidth: 2,

                                  color: Colors.black,
                                ),
                              )
                            : const Icon(Icons.verified_rounded, size: 20),

                        label: Text(_isSaving ? 'SALVANDO...' : 'FINALIZAR'),

                        style: ElevatedButton.styleFrom(
                          backgroundColor: _accentBlue,

                          foregroundColor: Colors.black,

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),

                          elevation: 0,

                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w900,

                            letterSpacing: 1,
                          ),
                        ),

                        onPressed: _isSaving ? null : _saveAndFinish,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

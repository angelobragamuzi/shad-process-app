// ignore_for_file: deprecated_member_use, unused_field

import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:intl/intl.dart';

import 'package:shadprocess/src/core/controllers/case_form_controller.dart';

import 'package:shadprocess/src/dependencies.dart';

import 'package:shadprocess/src/modules/process/widgets/format/oab_formatter.dart';

class CaseFormStepThree extends StatefulWidget {
  final PageController pageController;

  const CaseFormStepThree({super.key, required this.pageController});

  @override
  State<CaseFormStepThree> createState() => _CaseFormStepThreeState();
}

class _CaseFormStepThreeState extends State<CaseFormStepThree> {
  final _formKey = GlobalKey<FormState>();

  // Representative

  final _repNameCtrl = TextEditingController();

  final _repBarCtrl = TextEditingController();

  final _repContactCtrl = TextEditingController();

  // Document

  final _docNotesCtrl = TextEditingController();

  final _docPathCtrl = TextEditingController();

  DateTime _docDate = DateTime.now();

  String _docType = 'Petição Inicial';

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

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,

      withData: false,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _docPathCtrl.text = result.files.single.path!;
      });
    }
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
              _section('Representante legal', [
                TextFormField(
                  controller: _repNameCtrl,

                  style: textStyle,

                  decoration: _decoration(
                    'Nome do Advogado',

                    icon: Icons.person_pin_outlined,
                  ),

                  validator: (v) =>
                      v == null || v.isEmpty ? 'Informe o nome' : null,
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: _repBarCtrl,

                  style: textStyle,

                  keyboardType: TextInputType.text,

                  textCapitalization: TextCapitalization.characters,

                  decoration: _decoration(
                    'Número da OAB',

                    icon: Icons.badge_outlined,
                  ),

                  inputFormatters: [
                    LengthLimitingTextInputFormatter(9),

                    OabInputFormatter(),
                  ],

                  validator: (v) =>
                      v == null || v.isEmpty ? 'Informe a OAB' : null,
                ),

                const SizedBox(height: 12),

                TextFormField(
                  controller: _repContactCtrl,

                  style: textStyle,

                  decoration: _decoration(
                    'Contato / E-mail',

                    icon: Icons.alternate_email_rounded,
                  ),

                  validator: (v) =>
                      v == null || v.isEmpty ? 'Informe o contato' : null,
                ),
              ]),

              _section('Documento inicial', [
                DropdownButtonFormField<String>(
                  value: _docType,

                  dropdownColor: _cardBg,

                  style: textStyle,

                  decoration: _decoration(
                    'Tipo de documento',

                    icon: Icons.file_present_outlined,
                  ),

                  items:
                      [
                            'Petição Inicial',

                            'Contestação',

                            'Recurso',

                            'Decisão',

                            'Sentença',

                            'Outro',
                          ]
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),

                  onChanged: (v) => setState(() => _docType = v!),
                ),

                const SizedBox(height: 12),

                _buildDateTile(
                  'Data do documento',

                  DateFormat('dd/MM/yyyy').format(_docDate),

                  _pickDate,
                ),

                const SizedBox(height: 16),

                TextFormField(
                  controller: _docNotesCtrl,

                  maxLines: 2,

                  style: textStyle,

                  decoration: _decoration('Observações adicionais'),
                ),

                const SizedBox(height: 16),

                // Upload Area
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SizedBox(
                      width: double.infinity,

                      height: 50,

                      child: OutlinedButton.icon(
                        icon: const Icon(
                          Icons.cloud_upload_outlined,

                          color: _accentBlue,
                        ),

                        label: const Text(
                          'SELECIONAR ARQUIVO',

                          style: TextStyle(
                            color: Colors.white,

                            fontWeight: FontWeight.bold,

                            fontSize: 13,
                          ),
                        ),

                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: _accentBlue.withOpacity(0.5)),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),

                        onPressed: _pickFile,
                      ),
                    ),

                    if (_docPathCtrl.text.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),

                        child: Container(
                          padding: const EdgeInsets.all(12),

                          decoration: BoxDecoration(
                            color: _accentBlue.withOpacity(0.05),

                            borderRadius: BorderRadius.circular(12),

                            border: Border.all(
                              color: _accentBlue.withOpacity(0.2),
                            ),
                          ),

                          child: Row(
                            children: [
                              const Icon(
                                Icons.insert_drive_file_outlined,

                                color: _accentBlue,

                                size: 18,
                              ),

                              const SizedBox(width: 10),

                              Expanded(
                                child: Text(
                                  _docPathCtrl.text.split('/').last,

                                  style: const TextStyle(
                                    color: _accentBlue,

                                    fontWeight: FontWeight.w600,

                                    fontSize: 13,
                                  ),

                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              IconButton(
                                icon: const Icon(
                                  Icons.close,

                                  color: Colors.redAccent,

                                  size: 18,
                                ),

                                onPressed: () =>
                                    setState(() => _docPathCtrl.clear()),
                              ),
                            ],
                          ),
                        ),
                      ),

                    if (_docPathCtrl.text.isEmpty)
                      const Padding(
                        padding: EdgeInsets.only(top: 8, left: 4),

                        child: Text(
                          'Nenhum arquivo anexado',

                          style: TextStyle(color: Colors.white24, fontSize: 12),
                        ),
                      ),
                  ],
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
                            : const Icon(Icons.check_circle_rounded, size: 20),

                        label: Text(
                          _isSaving ? 'Salvando...' : 'SALVAR E CONTINUAR',
                        ),

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

  Future<void> _pickDate() async {
    final date = await showDatePicker(
      context: context,

      initialDate: _docDate,

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

    if (date != null) setState(() => _docDate = date);
  }

  Future<void> _saveAndFinish() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSaving = true);

    try {
      await _controller.saveStepThree(
        representativeName: _repNameCtrl.text,

        barNumber: _repBarCtrl.text,

        contact: _repContactCtrl.text,

        documentType: _docType,

        documentDate: _docDate,

        notes: _docNotesCtrl.text,

        filePath: _docPathCtrl.text,
      );

      if (!mounted) return;

      widget.pageController.animateToPage(
        3,

        duration: const Duration(milliseconds: 300),

        curve: Curves.easeInOut,
      );
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }
}

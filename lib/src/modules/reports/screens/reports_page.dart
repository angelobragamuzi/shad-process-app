import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:shadprocess/src/core/database/database.dart';
import 'package:shadprocess/src/core/repository/case/case_repository.dart';
import 'package:shadprocess/src/core/services/reports/reports_services.dart';

class ReportsPage extends StatefulWidget {
  final AppDatabase db;
  const ReportsPage({super.key, required this.db});

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  final List<Map<String, String>> _messages = [];
  bool _isTyping = false;
  final TextEditingController _chatController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ReportService _reportService = ReportService();
  late CaseRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = CaseRepository(widget.db);
    _messages.add({
      "role": "ai",
      "text":
          "Olá! Solicite um relatório jurídico e eu prepararei a prévia para você.",
    });
  }

  Future<void> _handleSend() async {
    final text = _chatController.text.trim();
    if (text.isEmpty || _isTyping) return;

    setState(() {
      _messages.add({"role": "user", "text": text});
      _isTyping = true;
    });
    _chatController.clear();
    _scrollToBottom();

    try {
      final contextData = await _repository.getDetailedCasesContext();
      final metrics = await _repository.getDashboardMetrics();

      final response = await _reportService.generateAiReport(
        userRequest: text,
        context: contextData,
        metrics: metrics,
      );

      setState(() {
        _messages.add({"role": "ai", "text": response});
        _isTyping = false;
      });
    } catch (e) {
      setState(() {
        _messages.add({
          "role": "ai",
          "text": "Erro técnico ao gerar o relatório.",
        });
        _isTyping = false;
      });
    }
    _scrollToBottom();
  }

  void _scrollToBottom() => WidgetsBinding.instance.addPostFrameCallback((_) {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1113),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('ShadBot Relatórios'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ChatReportBubble(
                  text: msg['text']!,
                  isAi: msg['role'] == 'ai',
                  service: _reportService,
                );
              },
            ),
          ),
          if (_isTyping)
            const LinearProgressIndicator(color: Color(0xFF00D1FF)),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF1A1D21),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _chatController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: "Ex: Relatório de processos ativos...",
                  hintStyle: const TextStyle(color: Colors.white24),
                  filled: true,
                  fillColor: const Color(0xFF0F1113),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (_) => _handleSend(),
              ),
            ),
            IconButton(
              onPressed: _handleSend,
              icon: const Icon(Icons.send, color: Color(0xFF00D1FF)),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// 2. WIDGET DE BALÃO (EXPANSÍVEL)
// ==========================================
class ChatReportBubble extends StatefulWidget {
  final String text;
  final bool isAi;
  final ReportService service;

  const ChatReportBubble({
    super.key,
    required this.text,
    required this.isAi,
    required this.service,
  });

  @override
  State<ChatReportBubble> createState() => _ChatReportBubbleState();
}

class _ChatReportBubbleState extends State<ChatReportBubble> {
  bool _showPreview = false;

  @override
  Widget build(BuildContext context) {
    // Definimos se deve mostrar o botão baseado no conteúdo
    final bool canShowPdf = widget.isAi && widget.text.length > 30;

    return Align(
      alignment: widget.isAi ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.85,
        ),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: widget.isAi
              ? const Color(0xFF1A1D21)
              : const Color(0xFF00D1FF).withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.isAi
                ? Colors.white10
                : const Color(0xFF00D1FF).withOpacity(0.3),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            if (canShowPdf) ...[
              const Divider(color: Colors.white10, height: 20),
              ElevatedButton.icon(
                onPressed: () => setState(() => _showPreview = !_showPreview),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00D1FF),
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 40),
                ),
                icon: Icon(
                  _showPreview ? Icons.keyboard_arrow_up : Icons.picture_as_pdf,
                  size: 18,
                ),
                label: Text(_showPreview ? "OCULTAR" : "VER PDF"),
              ),
              if (_showPreview)
                Container(
                  height: 450,
                  margin: const EdgeInsets.only(top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: PdfPreview(
                      build: (format) =>
                          widget.service.makePdfData(widget.text),
                      useActions: true,
                      canChangePageFormat: false,
                      canDebug: false,
                    ),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}

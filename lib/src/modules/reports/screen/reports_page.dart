import 'package:flutter/material.dart';
import 'package:shadprocess/src/core/database/database.dart';
import 'package:shadprocess/src/core/repository/case_repository.dart';
import 'package:shadprocess/src/core/services/agent/gemini_service.dart';

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
  final GeminiService _gemini = GeminiService();
  late CaseRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = CaseRepository(widget.db);
    _messages.add({
      "role": "ai",
      "text":
          "Olá! Sou o ShadProcess. Analiso todos os seus processos em tempo real. Como posso ajudar?",
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

      final response = await _gemini.chatJuridico(
        message: text,
        detailedContext: contextData,
        metrics: metrics,
        history: _messages.sublist(0, _messages.length - 1),
      );

      setState(() {
        _messages.add({"role": "ai", "text": response});
        _isTyping = false;
      });
    } catch (e) {
      setState(() {
        _messages.add({
          "role": "ai",
          "text": "Erro técnico ao acessar processos.",
        });
        _isTyping = false;
      });
    }
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1113),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'ShadBot ',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
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
                final isAi = msg['role'] == 'ai';
                return _buildChatBubble(msg['text']!, isAi);
              },
            ),
          ),
          if (_isTyping)
            const LinearProgressIndicator(
              backgroundColor: Colors.transparent,
              color: Color(0xFF00D1FF),
            ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String text, bool isAi) {
    return Align(
      alignment: isAi ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isAi
              ? const Color(0xFF1A1D21)
              : const Color(0xFF00D1FF).withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 13),
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF1A1D21),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _chatController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Pergunte algo...",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
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
    );
  }
}

// ignore_for_file: depend_on_referenced_packages, avoid_print
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../repository/case_repository.dart';

class GeminiService {
  final String apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';

  Future<String> chatJuridico({
    required String message,
    required List<Map<String, dynamic>> detailedContext,
    required DashboardMetrics metrics,
    List<Map<String, String>> history = const [],
  }) async {
    const modelName = "gemini-2.5-flash-preview-09-2025";
    final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1beta/models/$modelName:generateContent?key=$apiKey",
    );

    final systemInstruction =
        """
Você é o ShadProcess, assistente jurídico técnico. Use o JSON abaixo como única fonte de verdade.
ESTATÍSTICAS: Total: ${metrics.total} | Ativos: ${metrics.active} | Alta Prioridade: ${metrics.highPriorityCount}
CONTEXTO: ${jsonEncode(detailedContext)}

DIRETRIZES:
1. Idioma: Português (Brasil). Tom: Profissional e extremamente direto.
2. Formatação: Use **negrito** para números de processo e tabelas Markdown para listas.
3. Se o dado não estiver no JSON, diga: "Informação não localizada na base de dados. Forneça mais detalhes."
4. Não invente prazos ou movimentações.
""";

    final historyParts = history
        .map(
          (msg) => {
            "role": msg['role'] == 'user' ? 'user' : 'model',
            "parts": [
              {"text": msg['text']},
            ],
          },
        )
        .toList();

    final body = {
      "contents": [
        ...historyParts,
        {
          "role": "user",
          "parts": [
            {"text": "$systemInstruction\n\nPergunta: $message"},
          ],
        },
      ],
      "generationConfig": {
        "temperature": 0.1,
        "topP": 0.95,
        "maxOutputTokens": 800,
      },
    };

    return _sendRequestWithRetry(url, body);
  }

  Future<String> _sendRequestWithRetry(
    Uri url,
    Map<String, dynamic> body,
  ) async {
    const maxRetries = 3;
    for (int i = 0; i < maxRetries; i++) {
      try {
        final response = await http.post(
          url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(body),
        );

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          return data["candidates"][0]["content"]["parts"][0]["text"];
        }
        if (response.statusCode != 429 && response.statusCode < 500) break;
        await Future.delayed(Duration(seconds: i + 1));
      } catch (e) {
        if (i == maxRetries - 1) return "Erro de conexão com o ShadProcess.";
      }
    }
    return "O assistente está indisponível no momento.";
  }
}

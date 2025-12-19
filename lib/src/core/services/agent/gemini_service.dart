// ignore_for_file: depend_on_referenced_packages, avoid_print
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../repository/case/case_repository.dart';

class GeminiService {
  final String apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';

  Future<String> chatJuridico({
    required String message,
    required List<Map<String, dynamic>> detailedContext,
    required DashboardMetrics metrics,
  }) async {
    const modelName = "gemini-2.5-flash-preview-09-2025";

    if (apiKey.isEmpty) {
      print("GEMINI_API_KEY está vazia");
      return "Chave da API não configurada.";
    }

    final url = Uri.parse(
      "https://generativelanguage.googleapis.com/v1beta/models/$modelName:generateContent?key=$apiKey",
    );

    final systemInstruction =
        """
VOCÊ É O SHADPROCESS.
Assistente jurídico operacional.

Use APENAS os dados fornecidos no JSON. Seja extremamente direto.
Não coloque asteriscos (**), hashtags (#) ou notas.
Datas no formato DD/MM/AAAA.

ESTATÍSTICAS ATUAIS:
Total: ${metrics.total} | Ativos: ${metrics.active} | Arquivados: ${metrics.archived}

CONTEXTO DOS PROCESSOS:
${jsonEncode(detailedContext)}
""";

    final body = {
      "contents": [
        {
          "role": "user",
          "parts": [
            {"text": "$systemInstruction\n\nPergunta do usuário: $message"},
          ],
        },
      ],
      "generationConfig": {
        "temperature": 0.0,
        "topP": 0.1,
        "maxOutputTokens": 4048,
      },
    };

    final encodedBody = jsonEncode(body);
    print("BODY SIZE: ${encodedBody.length} bytes");

    return _sendRequestWithRetry(url, encodedBody);
  }

  Future<String> _sendRequestWithRetry(Uri url, String encodedBody) async {
    const maxRetries = 3;

    for (int attempt = 1; attempt <= maxRetries; attempt++) {
      try {
        final response = await http.post(
          url,
          headers: {"Content-Type": "application/json"},
          body: encodedBody,
        );

        if (response.statusCode == 200) {
          final decoded = jsonDecode(response.body);
          final candidates = decoded["candidates"];

          if (candidates == null || candidates.isEmpty) return "Sem resposta.";

          final candidate = candidates[0];

          if (candidate["finishReason"] == "MAX_TOKENS") {
            return "Relatório muito longo. Tente filtrar por um período ou tipo específico.";
          }

          final text = candidate["content"]?["parts"]?[0]?["text"];
          return text?.toString().trim() ?? "Erro na resposta.";
        }

        if (response.statusCode == 429) {
          await Future.delayed(Duration(seconds: attempt * 2));
          continue;
        }

        return "Erro técnico (Status: ${response.statusCode})";
      } catch (e) {
        if (attempt == maxRetries) return "Falha de conexão persistente.";
        await Future.delayed(const Duration(seconds: 1));
      }
    }
    return "O assistente está temporariamente indisponível.";
  }
}

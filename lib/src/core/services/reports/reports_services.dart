import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../agent/gemini_service.dart';
import '../../repository/case/case_repository.dart';

class ReportService {
  final GeminiService _gemini = GeminiService();

  Future<String> generateAiReport({
    required String userRequest,
    required List<Map<String, dynamic>> context,
    required DashboardMetrics metrics,
  }) async {
    final compactContext = context
        .map(
          (c) => {
            'p': c['case_number'],
            't': c['type'],
            's': c['status'],
            'cl': c['client_name'],
          },
        )
        .toList();

    return await _gemini.chatJuridico(
      message: userRequest,
      detailedContext: compactContext,
      metrics: metrics,
    );
  }

  Future<Uint8List> makePdfData(String content) async {
    final pdf = pw.Document();
    final cleanText = content
        .replaceAll('*', '')
        .replaceAll('#', '')
        .replaceAll('_', '');
    final List<String> lines = cleanText.split('\n');

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(30),
        build: (pw.Context context) => [
          pw.Text(
            "RELATÓRIO SHADPROCESS",
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14),
          ),
          pw.Divider(),
          pw.SizedBox(height: 10),
          ...lines.map(
            (line) => pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 2),
              child: pw.Text(
                line.trim(),
                style: const pw.TextStyle(fontSize: 9),
              ),
            ),
          ),
        ],
      ),
    );
    return pdf.save();
  }
}

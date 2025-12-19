import 'package:flutter/material.dart';
import 'dashboard_widget_config.dart';

class DashboardWidgetFactory {
  static Widget buildPreview(DashboardWidgetType type) {
    switch (type) {
      case DashboardWidgetType.alertBanner:
        return _previewBox("Banner de alerta", height: 44);

      case DashboardWidgetType.statsOverview:
        return Column(
          children: [
            _previewBox("Card estatístico", height: 60),
            const SizedBox(height: 8),
            _previewBox("Card estatístico", height: 60),
          ],
        );

      case DashboardWidgetType.workload:
        return _previewBox("Gráfico semanal", height: 90);

      case DashboardWidgetType.typeDistribution:
        return _previewBox("Distribuição por área", height: 70);

      case DashboardWidgetType.courtDistribution:
        return _previewBox("Distribuição por tribunal", height: 70);

      case DashboardWidgetType.upcomingDeadlines:
        return _previewBox("Lista de compromissos", height: 100);
    }
  }

  static Widget _previewBox(String label, {required double height}) {
    return Container(
      height: height,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white38,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

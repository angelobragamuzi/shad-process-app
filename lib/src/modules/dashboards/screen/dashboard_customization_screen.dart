// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:shadprocess/src/core/repository/dashboard/dashboard_config_repository.dart';
import 'package:shadprocess/src/modules/dashboards/widgets/dashboard_widget_config.dart';

class DashboardCustomizationScreen extends StatefulWidget {
  const DashboardCustomizationScreen({super.key});

  @override
  State<DashboardCustomizationScreen> createState() =>
      _DashboardCustomizationScreenState();
}

class _DashboardCustomizationScreenState
    extends State<DashboardCustomizationScreen> {
  final repo = GetIt.I<DashboardConfigRepository>();

  final Color _accentBlue = const Color(0xFF00D1FF);
  final Color _bgScaffold = const Color(0xFF0F1113);
  final Color _bgCard = const Color(0xFF1A1D21);
  final Color _borderColor = Colors.white.withOpacity(0.08);
  final Color _textSub = const Color(0xFF8A8F98);

  List<DashboardWidgetConfig> items = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final data = await repo.getConfig();
    setState(() {
      items = data..sort((a, b) => a.order.compareTo(b.order));
    });
  }

  void _onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex--;
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);

    for (int i = 0; i < items.length; i++) {
      items[i] = items[i].copyWith(order: i);
    }

    repo.saveConfig(items);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgScaffold,
      appBar: AppBar(
        backgroundColor: _bgScaffold,
        elevation: 0,
        title: const Text(
          'Personalizar Dashboard',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ReorderableListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
        itemCount: items.length,
        onReorder: _onReorder,

        proxyDecorator: (child, index, animation) {
          return AnimatedBuilder(
            animation: animation,
            builder: (context, _) {
              return Material(
                color: _bgCard,
                elevation: 8,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: _accentBlue.withOpacity(0.35)),
                    color: _bgCard,
                  ),
                  child: child,
                ),
              );
            },
          );
        },

        itemBuilder: (context, index) {
          final item = items[index];

          return Container(
            key: ValueKey(item.type),
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _bgCard,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _borderColor),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _label(item.type),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.enabled ? "Visível" : "Oculto",
                        style: TextStyle(
                          color: item.enabled ? _accentBlue : _textSub,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: item.enabled,
                  activeColor: _accentBlue,
                  onChanged: (v) {
                    final i = items.indexOf(item);
                    items[i] = item.copyWith(enabled: v);
                    repo.saveConfig(items);
                    setState(() {});
                  },
                ),
                const Icon(Icons.drag_indicator_rounded, color: Colors.white38),
              ],
            ),
          );
        },
      ),
    );
  }

  String _label(DashboardWidgetType type) {
    switch (type) {
      case DashboardWidgetType.alertBanner:
        return "Alertas";
      case DashboardWidgetType.statsOverview:
        return "Resumo Geral";
      case DashboardWidgetType.workload:
        return "Carga de Prazos";
      case DashboardWidgetType.typeDistribution:
        return "Distribuição por Área";
      case DashboardWidgetType.courtDistribution:
        return "Distribuição por Tribunal";
      case DashboardWidgetType.upcomingDeadlines:
        return "Próximos Compromissos";
    }
  }
}

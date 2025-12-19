// ignore_for_file: deprecated_member_use, unnecessary_to_list_in_spreads
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import 'package:shadprocess/src/core/repository/case/case_repository.dart';
import 'package:shadprocess/src/core/repository/dashboard/dashboard_config_repository.dart';
import 'package:shadprocess/src/modules/dashboards/screen/dashboard_customization_screen.dart';
import 'package:shadprocess/src/modules/dashboards/widgets/dashboard_widget_config.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final caseRepository = GetIt.I<CaseRepository>();
  final dashboardConfigRepo = GetIt.I<DashboardConfigRepository>();

  final Color _accentBlue = const Color(0xFF00D1FF);
  final Color _bgScaffold = const Color(0xFF0F1113);
  final Color _bgCard = const Color(0xFF1A1D21);
  final Color _textSub = const Color(0xFF8A8F98);
  final Color _borderColor = Colors.white.withOpacity(0.08);

  Future<void> _onRefresh() async {
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 600));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgScaffold,
      appBar: AppBar(
        backgroundColor: _bgScaffold,
        elevation: 0,
        centerTitle: false,
        toolbarHeight: 45,
        title: const Text(
          'Dashboard Jurídico',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Personalizar dashboard',
            icon: const Icon(Icons.tune_rounded, color: Colors.white, size: 22),
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const DashboardCustomizationScreen(),
                ),
              );

              // força rebuild ao voltar da personalização
              setState(() {});
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        color: _accentBlue,
        backgroundColor: _bgCard,
        onRefresh: _onRefresh,
        child: FutureBuilder(
          future: Future.wait([
            caseRepository.getDashboardMetrics(),
            dashboardConfigRepo.getConfig(),
          ]),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: _accentBlue,
                  strokeWidth: 2,
                ),
              );
            }

            if (snapshot.hasError || !snapshot.hasData) {
              return const Center(
                child: Text(
                  "Erro ao carregar dados",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            final DashboardMetrics data = snapshot.data![0] as DashboardMetrics;

            final List<DashboardWidgetConfig> config =
                (snapshot.data![1] as List<DashboardWidgetConfig>)
                    .where((DashboardWidgetConfig c) => c.enabled)
                    .toList()
                  ..sort((a, b) => a.order.compareTo(b.order));

            return CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      config.map((item) {
                        switch (item.type) {
                          case DashboardWidgetType.alertBanner:
                            return data.highPriorityCount > 0
                                ? Column(
                                    children: [
                                      _buildAlertBanner(data.highPriorityCount),
                                      const SizedBox(height: 8),
                                    ],
                                  )
                                : const SizedBox();

                          case DashboardWidgetType.statsOverview:
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildStatCard(
                                        "Total",
                                        data.total,
                                        Colors.white,
                                        Icons.account_balance_wallet_outlined,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: _buildStatCard(
                                        "Em Curso",
                                        data.active,
                                        _accentBlue,
                                        Icons.bolt_rounded,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(
                                      child: _buildStatCard(
                                        "Concluídos",
                                        data.finished,
                                        const Color(0xFF4ADE80),
                                        Icons.check_circle_outline_rounded,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: _buildStatCard(
                                        "Arquivados",
                                        data.archived,
                                        const Color(0xFFFBBF24),
                                        Icons.inventory_2_outlined,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                              ],
                            );

                          case DashboardWidgetType.workload:
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildSectionTitle("Carga de Prazos"),
                                const SizedBox(height: 6),
                                _buildWeeklyWorkload(data.upcomingDeadlines),
                                const SizedBox(height: 12),
                              ],
                            );

                          case DashboardWidgetType.typeDistribution:
                            return Row(
                              children: [
                                Expanded(
                                  child: _buildMetricPanel(
                                    title: "Áreas",
                                    child: _buildTypeDistribution(data.byType),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: _buildMetricPanel(
                                    title: "Tribunais",
                                    child: _buildCourtDistribution(
                                      data.upcomingDeadlines,
                                    ),
                                  ),
                                ),
                              ],
                            );

                          case DashboardWidgetType.upcomingDeadlines:
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 12),
                                _buildSectionTitle("Próximos Compromissos"),
                                const SizedBox(height: 6),
                                if (data.upcomingDeadlines.isEmpty)
                                  _emptyLabel()
                                else
                                  ...data.upcomingDeadlines
                                      .take(2)
                                      .map(_buildDeadlineItem),
                              ],
                            );

                          case DashboardWidgetType.courtDistribution:
                            return const SizedBox(); // já incluso acima
                        }
                      }).toList(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // ======================= WIDGETS =======================

  Widget _buildSectionTitle(String title) => Text(
    title.toUpperCase(),
    style: TextStyle(
      color: _textSub,
      fontSize: 11,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
    ),
  );

  Widget _buildStatCard(String title, int value, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22, color: color),
          const SizedBox(height: 8),
          Text(
            value.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: _textSub,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricPanel({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(height: 65, child: child),
        ],
      ),
    );
  }

  Widget _buildWeeklyWorkload(List<CaseListItem> cases) {
    final now = DateTime.now();
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(7, (index) {
          final day = now.add(Duration(days: index));
          final count = cases
              .where((c) => c.legalCase.startDate.day == day.day)
              .length;
          final isToday = index == 0;

          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 10,
                height: (count * 15.0).clamp(6.0, 55.0),
                decoration: BoxDecoration(
                  color: isToday
                      ? _accentBlue
                      : count > 0
                      ? _accentBlue.withOpacity(0.4)
                      : Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                DateFormat('E').format(day).substring(0, 1).toUpperCase(),
                style: TextStyle(
                  color: isToday ? Colors.white : _textSub,
                  fontSize: 11,
                  fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildDeadlineItem(CaseListItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: _bgCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: _borderColor),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: _accentBlue.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('dd').format(item.legalCase.startDate),
                  style: TextStyle(
                    color: _accentBlue,
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                  ),
                ),
                Text(
                  DateFormat(
                    'MMM',
                  ).format(item.legalCase.startDate).toUpperCase(),
                  style: TextStyle(
                    color: _accentBlue,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.legalCase.caseNumber,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  item.mainPartyName,
                  style: TextStyle(color: _textSub, fontSize: 11),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypeDistribution(Map<String, int> data) {
    final sorted = data.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: sorted.take(2).map((e) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      e.key,
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                      maxLines: 1,
                    ),
                  ),
                  Text(
                    "${e.value}",
                    style: TextStyle(
                      color: _accentBlue,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: e.value / 10,
                minHeight: 4,
                backgroundColor: Colors.white10,
                color: _accentBlue,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCourtDistribution(List<CaseListItem> cases) {
    final Map<String, int> counts = {};
    for (var item in cases) {
      counts[item.legalCase.court] = (counts[item.legalCase.court] ?? 0) + 1;
    }

    final sorted = counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: sorted.take(2).map((e) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Row(
            children: [
              Icon(Icons.gavel_rounded, size: 12, color: _textSub),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  e.key,
                  style: const TextStyle(color: Colors.white, fontSize: 11),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "${e.value}",
                style: TextStyle(
                  color: _accentBlue,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAlertBanner(int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.redAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.redAccent.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.error_outline_rounded,
            size: 20,
            color: Colors.redAccent,
          ),
          const SizedBox(width: 12),
          Text(
            "$count Prazos Urgentes",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyLabel() => Center(
    child: Text(
      "Sem registros",
      style: TextStyle(color: _textSub, fontSize: 11),
    ),
  );
}

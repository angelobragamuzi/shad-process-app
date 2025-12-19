import 'package:shadprocess/src/modules/dashboards/widgets/dashboard_widget_config.dart';

import 'dashboard_config_repository.dart';

class DashboardConfigRepositoryImpl implements DashboardConfigRepository {
  List<DashboardWidgetConfig> _cache = [
    DashboardWidgetConfig(
      type: DashboardWidgetType.alertBanner,
      enabled: true,
      order: 0,
    ),
    DashboardWidgetConfig(
      type: DashboardWidgetType.statsOverview,
      enabled: true,
      order: 1,
    ),
    DashboardWidgetConfig(
      type: DashboardWidgetType.workload,
      enabled: true,
      order: 2,
    ),
    DashboardWidgetConfig(
      type: DashboardWidgetType.typeDistribution,
      enabled: true,
      order: 3,
    ),
    DashboardWidgetConfig(
      type: DashboardWidgetType.courtDistribution,
      enabled: true,
      order: 4,
    ),
    DashboardWidgetConfig(
      type: DashboardWidgetType.upcomingDeadlines,
      enabled: true,
      order: 5,
    ),
  ];

  @override
  Future<List<DashboardWidgetConfig>> getConfig() async {
    return _cache..sort((a, b) => a.order.compareTo(b.order));
  }

  @override
  Future<void> saveConfig(List<DashboardWidgetConfig> config) async {
    _cache = config;
  }
}

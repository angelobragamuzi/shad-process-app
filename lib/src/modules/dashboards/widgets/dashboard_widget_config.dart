enum DashboardWidgetType {
  alertBanner,
  statsOverview,
  workload,
  typeDistribution,
  courtDistribution,
  upcomingDeadlines,
}

class DashboardWidgetConfig {
  final DashboardWidgetType type;
  final bool enabled;
  final int order;

  DashboardWidgetConfig({
    required this.type,
    required this.enabled,
    required this.order,
  });

  DashboardWidgetConfig copyWith({bool? enabled, int? order}) {
    return DashboardWidgetConfig(
      type: type,
      enabled: enabled ?? this.enabled,
      order: order ?? this.order,
    );
  }
}

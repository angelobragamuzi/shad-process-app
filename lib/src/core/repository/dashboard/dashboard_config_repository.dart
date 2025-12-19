import 'package:shadprocess/src/modules/dashboards/widgets/dashboard_widget_config.dart';

abstract class DashboardConfigRepository {
  Future<List<DashboardWidgetConfig>> getConfig();
  Future<void> saveConfig(List<DashboardWidgetConfig> config);
}

import 'package:shadprocess/src/modules/dashboards/widgets/dashboard_widget_config.dart';

class DashboardSlot {
  final DashboardWidgetType type;
  final int position;

  DashboardSlot({required this.type, required this.position});

  DashboardSlot copyWith({int? position}) {
    return DashboardSlot(type: type, position: position ?? this.position);
  }
}

abstract class DashboardLayoutRepository {
  Future<List<DashboardSlot>> getLayout();
  Future<void> saveLayout(List<DashboardSlot> slots);
}

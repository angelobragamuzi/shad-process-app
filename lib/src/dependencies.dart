import 'package:get_it/get_it.dart';
import 'package:shadprocess/src/core/repository/case/case_repository.dart';
import 'package:shadprocess/src/core/repository/dashboard/dashboard_config_repository.dart';
import 'package:shadprocess/src/core/repository/dashboard/dashboard_config_repository_impl.dart';
import 'core/controllers/case_form_controller.dart';
import 'core/database/database.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  getIt.registerLazySingleton<CaseRepository>(
    () => CaseRepository(getIt<AppDatabase>()),
  );

  getIt.registerFactory<CaseFormController>(
    () => CaseFormController(getIt<CaseRepository>()),
  );

  GetIt.I.registerLazySingleton<DashboardConfigRepository>(
    () => DashboardConfigRepositoryImpl(),
  );
}

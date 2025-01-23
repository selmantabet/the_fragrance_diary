import 'package:get_it/get_it.dart';
import 'package:the_fragrance_diary/services/database_service.dart';

final locator = GetIt.instance;

void setupDependencyInjection() {
  locator.registerLazySingleton(() => DatabaseService());
}

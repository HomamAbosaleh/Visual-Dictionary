import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:visual_dictionary/app/app_view_model.dart';
import 'package:visual_dictionary/services/firebase_service.dart';
import 'package:visual_dictionary/services/wikipedia_service.dart';

GetIt locator = GetIt.instance;


Future<void> setupLocator() async {
  locator.registerLazySingleton(() => AppViewModel());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => FirebaseService());
  locator.registerLazySingleton(() => WikipediaService());
}
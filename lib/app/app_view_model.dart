import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:visual_dictionary/di/locator.dart';
import 'package:visual_dictionary/services/firebase_service.dart';
import 'package:visual_dictionary/services/wikipedia_service.dart';

class AppViewModel extends BaseViewModel {
  final NavigationService navigationService = locator<NavigationService>();
  final FirebaseService firebaseService = locator<FirebaseService>();
  final WikipediaService wikipediaService = locator<WikipediaService>();

  init() {
    firebaseService.init();
  }
}

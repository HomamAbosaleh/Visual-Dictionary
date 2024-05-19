import 'package:stacked_services/stacked_services.dart';

import 'package:visual_dictionary/app/app.router.dart';
import 'package:visual_dictionary/ui/main/main_view_model.dart';

class SplashViewModel extends MainViewModel {
  @override
  init() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        NavigationService().pushNamedAndRemoveUntil(Routes.mainView);
      },
    );
  }
}

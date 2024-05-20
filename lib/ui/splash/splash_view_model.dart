import 'package:visual_dictionary/app/app.router.dart';
import 'package:visual_dictionary/app/app_view_model.dart';

class SplashViewModel extends AppViewModel {
  @override
  init() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        navigationService.navigateToMainView();
      },
    );
    super.init();
  }
}

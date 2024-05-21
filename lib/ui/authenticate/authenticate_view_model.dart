import 'package:visual_dictionary/app/app.router.dart';
import 'package:visual_dictionary/app/app_view_model.dart';

class AuthenticateViewModel extends AppViewModel {
  bool hasAnAccount = true;

  @override
  init() async {}

  void changePage() {
    hasAnAccount = !hasAnAccount;
    notifyListeners();
  }

  void login(String email, String password) async {
    final result = await firebaseService.signIn(email, password);
    if (result) navigationService.navigateToMainView();
  }

  void register(
      String name, String surname, String email, String password) async {
    final result = await firebaseService.signUp(name, surname, email, password);
    if (result) changePage();
  }
}

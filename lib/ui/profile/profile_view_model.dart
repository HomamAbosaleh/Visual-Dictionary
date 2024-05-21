import 'package:visual_dictionary/app/app.router.dart';

import 'package:visual_dictionary/models/responses/firebase_user.dart';
import 'package:visual_dictionary/ui/main/main_view_model.dart';

class ProfileViewModel extends MainViewModel {
  late FirebaseUser user;

  @override
  void init() {
    user = firebaseService.user!;
    super.init();
  }


  Future<void> logout() async {
    final result = await firebaseService.signOut();
    if (result) navigationService.navigateToAuthenticateView();
  }
}


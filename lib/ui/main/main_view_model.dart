import 'package:visual_dictionary/app/app_view_model.dart';
import 'package:visual_dictionary/models/responses/firebase_image.dart';

class MainViewModel extends AppViewModel {
  List<FirebaseImage> images = [];
  int _currentTabIndex = 0;
  int get currentTabIndex => _currentTabIndex;
  
  void setTabIndex(int value) {
    _currentTabIndex = value;
    notifyListeners();
  }

  @override
  init() async {
    images = await firebaseService.getImages();
    notifyListeners();
  }
}

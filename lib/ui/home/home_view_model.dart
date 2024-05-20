import 'package:visual_dictionary/app/app_view_model.dart';
import 'package:visual_dictionary/models/responses/firebase_image.dart';

class HomeViewModel extends AppViewModel {
  List<FirebaseImage> images = [];
  List<bool> expended = [];

  @override
  init() async {
    images = await firebaseService.getImages();
    expended = List.generate(images.length, (int index) => false);
    notifyListeners();
  }

  expandAccordion(int index, bool isExpanded) {
    expended[index] = !expended[index];
    notifyListeners();
  }
}

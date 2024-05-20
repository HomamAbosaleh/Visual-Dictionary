import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:visual_dictionary/constants/api_constants.dart';
import 'package:visual_dictionary/models/responses/firebase_image.dart';

class FirebaseService {
  final CollectionReference _imagesCollectionReference =
      FirebaseFirestore.instance.collection(ApiConstants.FIRESTORE_IMAGES_PATH);

  init() {
    signInAnonimously();
  }

  signInAnonimously() async {
    await FirebaseAuth.instance.signInAnonymously();
  }

  Future<List<FirebaseImage>> getImages() async {
    List<FirebaseImage> images = [];
    var value = await _imagesCollectionReference.orderBy("date").get();
    for (var element in value.docs) {
      var item = FirebaseImage.fromJson(element.data() as Map<String, dynamic>);
      images.add(item);
    }
    return images;
  }

  Future<void> addImage(String path, String type, String description) async {
    FirebaseImage image = FirebaseImage(
      path: path,
      type: type,
      description: description,
      date: DateTime.now(),
    );
    await _imagesCollectionReference.add(image.toJson());
  }
}

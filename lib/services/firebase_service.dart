import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:visual_dictionary/constants/api_constants.dart';
import 'package:visual_dictionary/models/responses/firebase_image.dart';
import 'package:visual_dictionary/models/responses/firebase_user.dart';

class FirebaseService {
  final CollectionReference _imagesCollectionReference =
      FirebaseFirestore.instance.collection(ApiConstants.FIRESTORE_IMAGES_PATH);
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection(ApiConstants.FIRESTORE_USERS_PATH);
  String? userId;
  FirebaseUser? user;

  init() {}

  Future<bool> signIn(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      userId = userCredential.user?.uid;
      user = await getUser(email);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signUp(
      String name, String surname, String email, String password) async {
    try {
      FirebaseUser user =
          FirebaseUser(name: name, surname: surname, email: email);
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await _usersCollectionReference.add(user.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<FirebaseUser> getUser(String email) async {
    var result = await _usersCollectionReference
        .where('email', isEqualTo: email)
        .get();
    return FirebaseUser.fromJson(result.docs.first.data() as Map<String, dynamic>);
  }

  Future<List<FirebaseImage>> getImages() async {
    List<FirebaseImage> images = [];
    var value = await _imagesCollectionReference
        .orderBy("date")
        .where('userId', isEqualTo: userId)
        .get();
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
      userId: userId!,
    );
    await _imagesCollectionReference.add(image.toJson());
  }
}

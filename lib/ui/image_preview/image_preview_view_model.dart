import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:visual_dictionary/app/app.router.dart';

import 'package:visual_dictionary/common/utils.dart';
import 'package:visual_dictionary/ui/main/main_view_model.dart';

class ImagePreviewViewModel extends MainViewModel {
  final GlobalKey globalKey = GlobalKey();
  late String type;
  String? description;

  initialize(String type) async {
    this.type = type;
    description = (await wikipediaService.fetchDescription(type)).extract;
    notifyListeners();
  }

  Future<void> takeScreenshot() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage();
    final path = await savePhoto("assets/screenshots", image);

    firebaseService.addImage(path, type, description!);
    await navigationService.navigateToMainView();
    setTabIndex(0);
  }
}

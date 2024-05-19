import 'package:stacked/stacked_annotations.dart';

import 'package:visual_dictionary/ui/main/main_view.dart';
import 'package:visual_dictionary/ui/object_detection/object_detection_view.dart';
import 'package:visual_dictionary/ui/splash/splash_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: MainView),
  MaterialRoute(page: ObjectDetectionView),
])
class App {}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;
import 'package:visual_dictionary/ui/image_preview/image_preview_view.dart'
    as _i4;
import 'package:visual_dictionary/ui/main/main_view.dart' as _i3;
import 'package:visual_dictionary/ui/splash/splash_view.dart' as _i2;

class Routes {
  static const splashView = '/';

  static const mainView = '/main-view';

  static const imagePreviewView = '/image-preview-view';

  static const all = <String>{
    splashView,
    mainView,
    imagePreviewView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.mainView,
      page: _i3.MainView,
    ),
    _i1.RouteDef(
      Routes.imagePreviewView,
      page: _i4.ImagePreviewView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
      );
    },
    _i3.MainView: (data) {
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.MainView(),
        settings: data,
      );
    },
    _i4.ImagePreviewView: (data) {
      final args = data.getArgs<ImagePreviewViewArguments>(nullOk: false);
      return _i5.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.ImagePreviewView(
            key: args.key,
            type: args.type,
            image: args.image,
            painter: args.painter),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ImagePreviewViewArguments {
  const ImagePreviewViewArguments({
    this.key,
    required this.type,
    required this.image,
    required this.painter,
  });

  final _i5.Key? key;

  final String type;

  final _i5.ImageProvider<Object> image;

  final _i5.CustomPainter painter;

  @override
  String toString() {
    return '{"key": "$key", "type": "$type", "image": "$image", "painter": "$painter"}';
  }

  @override
  bool operator ==(covariant ImagePreviewViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.type == type &&
        other.image == image &&
        other.painter == painter;
  }

  @override
  int get hashCode {
    return key.hashCode ^ type.hashCode ^ image.hashCode ^ painter.hashCode;
  }
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToImagePreviewView({
    _i5.Key? key,
    required String type,
    required _i5.ImageProvider<Object> image,
    required _i5.CustomPainter painter,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.imagePreviewView,
        arguments: ImagePreviewViewArguments(
            key: key, type: type, image: image, painter: painter),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithImagePreviewView({
    _i5.Key? key,
    required String type,
    required _i5.ImageProvider<Object> image,
    required _i5.CustomPainter painter,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.imagePreviewView,
        arguments: ImagePreviewViewArguments(
            key: key, type: type, image: image, painter: painter),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}

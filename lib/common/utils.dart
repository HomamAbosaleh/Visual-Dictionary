import 'dart:io';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

Future<String> getAssetPath(String asset) async {
  final pathstr = await getLocalPath(asset);
  await Directory(path.dirname(pathstr)).create(recursive: true);
  final file = File(pathstr);
  if (!await file.exists()) {
    final byteData = await rootBundle.load(asset);
    await file.writeAsBytes((byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)));
  }
  return file.path;
}

Future<String> savePhoto(String destinationPath, Image image) async {
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final pathstr = await getLocalPath("$destinationPath/$timestamp.png");
  await Directory(path.dirname(pathstr)).create(recursive: true);
  final byteData = await image.toByteData(format: ImageByteFormat.png);
  final pngBytes = byteData!.buffer.asUint8List();
  File imgFile = File(pathstr);
  imgFile.writeAsBytes(pngBytes);
  return imgFile.path;
}

Future<String> getLocalPath(String path) async {
  return '${(await getApplicationSupportDirectory()).path}/$path';
}

import 'dart:io';

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

Future<String> getLocalPath(String path) async {
  return '${(await getApplicationSupportDirectory()).path}/$path';
}


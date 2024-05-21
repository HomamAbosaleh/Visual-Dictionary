import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:translator/translator.dart';
import 'package:visual_dictionary/app/app.router.dart';

import 'package:visual_dictionary/common/object_detector_painter.dart';
import 'package:visual_dictionary/ui/object_detection/detector_view.dart';

import 'package:visual_dictionary/common/utils.dart';

class ObjectDetectionView extends StatefulWidget {
  const ObjectDetectionView({super.key});

  @override
  State<ObjectDetectionView> createState() => _ObjectDetectionViewState();
}

class _ObjectDetectionViewState extends State<ObjectDetectionView> {
  NavigationService navigationService = NavigationService();
  final translator = GoogleTranslator();
  late ObjectDetector _objectDetector;
  bool _canProcess = false;
  bool _isBusy = false;
  CustomPaint? _customPaint;
  String? _text;
  final _cameraLensDirection = CameraLensDirection.back;

  @override
  void initState() {
    _initializeDetector();
    super.initState();
  }

  @override
  void dispose() {
    _canProcess = false;
    _objectDetector.close();
    super.dispose();
  }

  Future<void> _initializeDetector() async {
    const path = 'assets/ml/object_labeler.tflite';
    final modelPath = await getAssetPath(path);
    final options = LocalObjectDetectorOptions(
      modelPath: modelPath,
      mode: DetectionMode.single,
      classifyObjects: true,
      multipleObjects: true,
    );
    _objectDetector = ObjectDetector(options: options);
    _canProcess = true;
  }

  Future<void> _processImage(
      InputImage inputImage, ImageProvider imageProvider) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _text = '';
    });
    final objects = await _objectDetector.processImage(inputImage);

    final DetectedObject highestConfidenceObject = objects.reduce((a, b) {
      final aMaxConfidence = a.labels.isNotEmpty
          ? a.labels
              .reduce((c, d) => c.confidence > d.confidence ? c : d)
              .confidence
          : 0.0;
      final bMaxConfidence = b.labels.isNotEmpty
          ? b.labels
              .reduce((c, d) => c.confidence > d.confidence ? c : d)
              .confidence
          : 0.0;
      return aMaxConfidence > bMaxConfidence ? a : b;
    });
    var type = (await translator.translate(highestConfidenceObject.labels.first.text,
            from: 'en', to: 'tr'))
        .text;

    if (inputImage.metadata?.size != null &&
        inputImage.metadata?.rotation != null) {
      final painter = ObjectDetectorPainter(
        highestConfidenceObject,
        inputImage.metadata!.size,
        inputImage.metadata!.rotation,
        _cameraLensDirection,
        type,
      );

      navigationService.navigateToImagePreviewView(
          painter: painter,
          image: imageProvider,
          type: type);
    } else {

      String text = 'Objects found: ${objects.length}\n\n';
      for (final object in objects) {
        text +=
            'Object:  trackingId: ${object.trackingId} - ${object.labels.map((e) => e.text)}\n\n';
      }

      _text = text;
      _customPaint = null;
    }
    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DetectorView(
        title: "Object Detector",
        customPaint: _customPaint,
        text: _text,
        onImage: _processImage,
        initialCameraLensDirection: _cameraLensDirection,
      ),
    );
  }
}

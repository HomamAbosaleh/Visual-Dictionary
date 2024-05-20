import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:visual_dictionary/ui/image_preview/image_preview_view_model.dart';

class ImagePreviewView extends StatelessWidget {
  final String type;
  final ImageProvider image;
  final CustomPainter painter;
  const ImagePreviewView({
    super.key,
    required this.type,
    required this.image,
    required this.painter,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ImagePreviewViewModel(),
      onViewModelReady: (model) => model.initialize(type),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.black54,
        body: Stack(
          children: [
            RepaintBoundary(
              key: viewModel.globalKey,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image(image: image),
                    CustomPaint(
                      size: Size.infinite,
                      painter: painter,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: Text(
                viewModel.description ?? '',
                style: const TextStyle(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 28,
              left: 0,
              child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: FloatingActionButton(
                  heroTag: Object(),
                  onPressed: () => Navigator.of(context).pop(),
                  backgroundColor: Colors.white,
                  child: const Text("Cancel"),
                ),
              ),
            ),
            Positioned(
              top: 28,
              right: 0,
              child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: FloatingActionButton(
                  heroTag: Object(),
                  onPressed: () => viewModel.takeScreenshot(),
                  backgroundColor: Colors.white,
                  child: const Text("Save"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

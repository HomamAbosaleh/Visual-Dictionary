import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:visual_dictionary/app/app.router.dart';

import 'package:visual_dictionary/ui/main/main_view_model.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MainViewModel(),
      onViewModelReady: (model) => model.init(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.purple,
              child: const Text("Object Detection"),
              onPressed: () {
                viewModel.navigationService.navigateTo(Routes.objectDetectionView);
              },
            )
          ],
        ),
      ),
    );
  }
}
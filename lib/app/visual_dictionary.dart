import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:visual_dictionary/app/app.router.dart';
import 'package:visual_dictionary/app/app_view_model.dart';
import 'package:visual_dictionary/di/locator.dart';

class VisualDictionary extends StatelessWidget {
  const VisualDictionary({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => locator<AppViewModel>(),
      onViewModelReady: (model) => model.init(),
      builder: (context, viewModel, child) => MaterialApp(
        title: 'DictionAIry',
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorObservers: [StackedService.routeObserver],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
      ),
    );
  }
}

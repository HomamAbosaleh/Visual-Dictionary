import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:visual_dictionary/ui/main/create_bottom_nav_item.dart';
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
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            createNavItem(TabItem.Home),
            createNavItem(TabItem.ObjectDetection),
          ],
          onTap: (value) {
            viewModel.setTabIndex(value);
          },
          currentIndex: viewModel.currentTabIndex,
        ),
        body: getViewForIndex(viewModel.currentTabIndex),
      ),
    );
  }
}

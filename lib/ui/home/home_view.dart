import 'dart:io';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:visual_dictionary/ui/home/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) => model.init(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ExpansionPanelList(
              expansionCallback: viewModel.expandAccordion,
              children: viewModel.images
                  .map(
                    (image) => ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          leading: Image(
                            image: FileImage(
                              File(image.path),
                            ),
                          ),
                          title: Text(image.type),
                        );
                      },
                      body: ListTile(
                        title: Text(image.description),
                      ),
                      isExpanded: viewModel.expended[viewModel.images.indexOf(image)],
                    ),
                  )
                  .toList()),
        )),
      ),
    );
  }
}

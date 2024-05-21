import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:visual_dictionary/ui/splash/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onViewModelReady: (model) => model.init(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: const Color(0xFF69C7D0),
        body:  Center(
          child: GestureDetector(
            onTap: () => viewModel.changeTap("onward"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 467,
                  height: 476,
                  child: Image.asset(
                    viewModel.tabs[viewModel.selectedTab].image,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20), // Resim ve kare arasında boşluk
                Container(
                  width: 300,
                  height: 200,
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEC1F52), //
                    borderRadius: BorderRadius.circular(12), //
                  ),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        viewModel.tabs[viewModel.selectedTab].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), //
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildDot(
                        isFilled: viewModel.selectedTab ==
                            0), // İlk yuvarlak içi dolu
                    const SizedBox(width: 8),
                    _buildDot(isFilled: viewModel.selectedTab == 1),
                    const SizedBox(width: 8),
                    _buildDot(isFilled: viewModel.selectedTab == 2),
                  ],
                ),
                viewModel.selectedTab > 0
                    ? Column(
                        children: [
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () => viewModel.changeTap("backward"),
                            child: const Text('Geri Git'),
                          ),
                        ],
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDot({bool isFilled = false}) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isFilled ? Colors.white : Colors.transparent,
        border: isFilled ? null : Border.all(color: Colors.white, width: 2),
      ),
    );
  }
}

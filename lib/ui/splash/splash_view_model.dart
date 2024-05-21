import 'package:visual_dictionary/app/app.router.dart';
import 'package:visual_dictionary/app/app_view_model.dart';

class SplashViewModel extends AppViewModel {
  final tabs = const [
    Tab("assets/images/1.png", "Hoş Geldiniz"),
    Tab("assets/images/2.png", "Nesneleri Keşfetmeye Hazır Mısınız?"),
    Tab("assets/images/3.png",
        "Yapay Zekanın Gücünü Görmek İçin Doğru Adrestesiniz."),
  ];

  int selectedTab = 0;

  changeTap(String direction) {
    if (direction == "onward") {
      if (selectedTab < 2) {
        selectedTab++;
      } else {
        if (firebaseService.userId != null) {
          navigationService.navigateToMainView();
        } else {
          navigationService.navigateToAuthenticateView();
        }
      }
    } else {
      selectedTab--;
    }
    notifyListeners();
  }
}

class Tab {
  final String image;
  final String title;

  const Tab(
    this.image,
    this.title,
  );
}

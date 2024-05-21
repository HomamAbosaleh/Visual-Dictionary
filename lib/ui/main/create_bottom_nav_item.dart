import 'package:flutter/material.dart';
import 'package:visual_dictionary/ui/home/home_view.dart';
import 'package:visual_dictionary/ui/object_detection/object_detection_view.dart';
import 'package:visual_dictionary/ui/profile/profile_view.dart';

class TabItemData {
  String label;
  Widget icon;
  TabItemData({
    required this.label,
    required this.icon,
  });
  static Map<TabItem, TabItemData> tabs = {
    TabItem.Home: TabItemData(
      label: "Anasayfa",
      icon: const Icon(Icons.home),
    ),
    TabItem.ObjectDetection: TabItemData(
      label: "Nesne Tanımlama",
      icon: const Icon(Icons.camera),
    ),
    TabItem.Profile: TabItemData(
      label: "Profilim",
      icon: const Icon(Icons.person),
    ),
  };
}

BottomNavigationBarItem createNavItem(TabItem tabItem) {
  final currentTab = TabItemData.tabs[tabItem]!;
  return BottomNavigationBarItem(
    icon: currentTab.icon,
    label: currentTab.label,
  );
}

// ignore: constant_identifier_names
enum TabItem { Home, ObjectDetection, Profile }

Widget getViewForIndex(int index) {
  switch (index) {
    case 0:
      return const HomeView();
    case 1:
      return const ObjectDetectionView();
    case 2:
      return const ProfileView();
    default:
      return Container();
  }
}

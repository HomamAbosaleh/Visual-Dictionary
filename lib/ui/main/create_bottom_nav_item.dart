import 'package:flutter/material.dart';
import 'package:visual_dictionary/ui/home/home_view.dart';
import 'package:visual_dictionary/ui/object_detection/object_detection_view.dart';

class TabItemData {
  String label;
  Widget icon;
  TabItemData({
    required this.label,
    required this.icon,
  });
  static Map<TabItem, TabItemData> tabs = {
    TabItem.Home:
        TabItemData(label: "Home", icon: const Icon(Icons.home_max_outlined)),
    TabItem.ObjectDetection:
        TabItemData(label: "Object Detection", icon: const Icon(Icons.camera_alt_outlined)),
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
enum TabItem { Home, ObjectDetection }

Widget getViewForIndex(int index) {
  switch (index) {
    case 0:
      return const HomeView();
    case 1:
      return const ObjectDetectionView();
    default:
      return Container();
  }
}

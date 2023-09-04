import 'package:flutter/material.dart';

List<BottomNavigationBarItem> bottomNavigationBarItems = const [
  BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined), label: "Home", tooltip: "Home"),
  BottomNavigationBarItem(
      icon: Icon(Icons.trending_up_rounded),
      label: "New & Hot",
      tooltip: "New & Hot"),
  BottomNavigationBarItem(
      icon: Icon(Icons.search_outlined), label: "Search", tooltip: "Search"),
  BottomNavigationBarItem(
      icon: Icon(Icons.download_outlined),
      label: "Downloads",
      tooltip: "Downloads"),
];

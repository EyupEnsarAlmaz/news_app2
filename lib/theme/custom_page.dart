import 'package:flutter/material.dart';

class AppTheme {
  static Color titleColor = Colors.black;
  static Color transparentColor = Colors.transparent;
  static Text todayTitle = const Text(
    "For You",
    style: TextStyle(fontWeight: FontWeight.w900),
  );
  static Text newsTitle = const Text(
    "News+",
    style: TextStyle(fontWeight: FontWeight.w900),
  );
  static Text audioTitle = const Text(
    "Audio",
    style: TextStyle(fontWeight: FontWeight.w900),
  );
  static double zero = 0;
  static double iconSize = 36.0;
  static EdgeInsets marginAllApp = const EdgeInsets.all(16.0);

}

class AppPadding {
  static double padding = 15.0;
}



AppBar appBar({required Widget title}) {
  return AppBar(
    elevation: AppTheme.zero,
    title: title,
    actions: [
      Padding(
        padding: EdgeInsets.all(AppPadding.padding),
        child: const Icon(Icons.search, size: 28),
      ),
    ],
    titleSpacing: AppTheme.zero,
    foregroundColor: AppTheme.titleColor,
    backgroundColor: AppTheme.transparentColor,
  );
}

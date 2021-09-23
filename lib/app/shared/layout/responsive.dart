import 'package:flutter/material.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;

class ResponsiveTool {
  static bool isLargeScreen(BuildContext ctx) =>
      MediaQuery.of(ctx).size.width >= mediumScreenSize;

  static bool isSmallScreen(BuildContext ctx) =>
      MediaQuery.of(ctx).size.width < mediumScreenSize;
}

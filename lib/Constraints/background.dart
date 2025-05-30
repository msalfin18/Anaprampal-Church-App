import 'package:flutter/material.dart';
import 'package:anaprampalmtc/Constraints/colors.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;

  Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
  }) : super(key: key);

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 576;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 576 &&
        MediaQuery.of(context).size.width <= 992;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width > 992;
  }

  // Utility methods to calculate dimensions based on device size
  static double screenHeight(BuildContext context, double percent) {
    return MediaQuery.of(context).size.height * percent;
  }

  static double screenWidth(BuildContext context, double percent) {
    return MediaQuery.of(context).size.width * percent;
  }

  // Container and padding sizes
  double containerHeight(BuildContext context) => screenHeight(context, 0.15);
  double containerWidth(BuildContext context) => screenWidth(context, 0.5);
  double padding(BuildContext context) => screenWidth(context, 0.02);

  // Image dimensions based on device size
  double containerImgHeight(BuildContext context) => screenHeight(context, 0.1);
  double containerImgWidth(BuildContext context) => screenWidth(context, 0.25);

  // Text styles
  TextStyle containerBoldTextStyle(BuildContext context) => TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: screenHeight(context, 0.03), // Example for adaptive font size
      );

  TextStyle containerNormalTextStyle(BuildContext context) => TextStyle(
        color: Colors.black,
        fontSize: screenHeight(context, 0.02),
      );

  // Member details and icons sizes
  double cardHeight(BuildContext context) => screenHeight(context, 0.2);
  double circleAvatarRadius(BuildContext context) => screenHeight(context, 0.05);
  double iconSize(BuildContext context) => screenHeight(context, 0.03);

  // Additional custom styles and paddings
  EdgeInsets outlinedContainerPadding(BuildContext context) => EdgeInsets.symmetric(
        horizontal: screenWidth(context, 0.03),
        vertical: screenHeight(context, 0.03),
      );

  OutlineInputBorder customOutlineInputBorder(BuildContext context) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(screenHeight(context, 0.015)),
        borderSide: BorderSide(color: themecolor, width: screenWidth(context, 0.004)),
      );

  



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (size.width >= 576 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}

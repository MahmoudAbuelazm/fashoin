import 'package:flutter/material.dart';

import 'colors.dart';
import 'font_weight_helper.dart';
import 'size_config.dart';

class TextStyles {
  static TextStyle font22Charcoalw700(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontWeight: FontWeightHelper.bold,
      color: ColorsManagers.charcoal,
    );
  }
  

  static TextStyle fontFlirtw700(context) {
    return const TextStyle(
      fontWeight: FontWeight.bold,
      color: ColorsManagers.flirt,
    );
  }

  static TextStyle font16w600(context) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
    );
  }
  static TextStyle font17w700(context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: getResponsiveFontSize(context, fontSize: 17),
    );
  }
  static TextStyle font20w500(context) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  }
  return width / 1500;
}

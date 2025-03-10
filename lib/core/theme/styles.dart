import 'package:flutter/material.dart';

import 'colors.dart';
import 'font_weight_helper.dart';
import 'size_config.dart';

class TextStyles {
  // static TextStyle font27Blackw600Inter(context) {
  //   return GoogleFonts.inter(
  //     fontSize: getResponsiveFontSize(context, fontSize: 27),
  //     fontWeight: FontWeightHelper.semiBold,
  //     color: Colors.black,
  //   );
  // }

  static TextStyle font22Charcoalw700(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontWeight: FontWeight.w700,
      color: ColorsManagers.charcoal,
    );
  }

  static TextStyle fontFlirtw700(context) {
    return const TextStyle(
     
      fontWeight: FontWeight.w700,
      color: ColorsManagers.flirt,
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

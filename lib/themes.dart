import 'package:flutter/services.dart';

import 'index.dart';

class ThemeConfig {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppConfigs.scaffoldLightColor,
    primaryColor: AppConfigs.appPrimaryColor,
    primaryColorDark: AppConfigs.appPrimaryColor,
    errorColor: ColorConstants.red500,
    hoverColor: Colors.white54,
    dividerColor: AppConfigs.viewLineColor,
    fontFamily: AppConfigs.fontFamily,
    appBarTheme: const AppBarTheme(
      color: AppConfigs.appLayoutBackground,
      iconTheme: IconThemeData(color: AppConfigs.textPrimaryColor),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
    colorScheme: const ColorScheme.light(
      primary: AppConfigs.appPrimaryColor,
    ),
    cardTheme: const CardTheme(color: ColorConstants.white),
    cardColor: ColorConstants.white,
    iconTheme: const IconThemeData(color: AppConfigs.textPrimaryColor),
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: ColorConstants.white),
    textTheme: const TextTheme(
      button: TextStyle(color: AppConfigs.appPrimaryColor),
      headline6: TextStyle(color: AppConfigs.textPrimaryColor),
      subtitle2: TextStyle(color: AppConfigs.textSecondaryColor),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppConfigs.appBackgroundColorDark,
    highlightColor: AppConfigs.appBackgroundColorDark,
    errorColor: const Color(0xFFCF6676),
    appBarTheme: const AppBarTheme(
      color: AppConfigs.appBackgroundColorDark,
      iconTheme: IconThemeData(color: ColorConstants.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    primaryColor: AppConfigs.appPrimaryColor,
    dividerColor: const Color(0xFFDADADA).withOpacity(0.3),
    primaryColorDark: AppConfigs.appPrimaryColor,
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: ColorConstants.white),
    hoverColor: Colors.black12,
    fontFamily: AppConfigs.fontFamily,
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppConfigs.appBackgroundColorDark),
    primaryTextTheme: const TextTheme(
        headline6: TextStyle(color: ColorConstants.white),
        overline: TextStyle(color: ColorConstants.white)),
    cardTheme: const CardTheme(color: AppConfigs.cardBackgroundBlackDark),
    cardColor: AppConfigs.appSecondaryBackgroundColor,
    iconTheme: const IconThemeData(color: ColorConstants.white),
    textTheme: const TextTheme(
      button: TextStyle(color: AppConfigs.appPrimaryColor),
      headline6: TextStyle(color: ColorConstants.white),
      subtitle2: TextStyle(color: Colors.white54),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: const ColorScheme.dark(
      primary: AppConfigs.appBackgroundColorDark,
      onPrimary: AppConfigs.cardBackgroundBlackDark,
    ).copyWith(secondary: ColorConstants.white),
  );
}

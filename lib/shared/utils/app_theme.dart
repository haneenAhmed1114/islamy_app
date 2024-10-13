import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/shared/utils/app_colors.dart';
import 'package:islami_application/shared/utils/app_styles.dart';

class AppTheme
{
  static ThemeData lightTheme = ThemeData(

    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
       backgroundColor: AppColors.transparent,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: AppStyles.appBarTextStyle,
      iconTheme: IconThemeData(
        color: AppColors.blackAppColor,
      ),
    ),
    scaffoldBackgroundColor: AppColors.transparent,
    canvasColor: AppColors.mainLightColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: AppColors.mainLightColor,
        selectedItemColor: AppColors.blackAppColor,
        unselectedItemColor: AppColors.whiteAppColor,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: AppStyles.labelStyleLight,
      ),
    dividerTheme:DividerThemeData(
      color: AppColors.mainLightColor,
        thickness: 3.0,
    ),

    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.whiteAppColor,
        onPrimary: AppColors.blackAppColor,
        secondary: AppColors.whiteAppColor,
        onSecondary: AppColors.blackAppColor,
        error: AppColors.whiteAppColor,
        onError: AppColors.whiteAppColor,
        surface: AppColors.mainLightColor,
        onSurface: AppColors.whiteAppColor,
    ),
    iconTheme: IconThemeData(
      color: AppColors.mainLightColor,
    ),
    textTheme: TextTheme(
      headlineMedium: AppStyles.semiBoldStyleHadeeth,
      bodyMedium: AppStyles.regularStyleContent,
      labelLarge: AppStyles.semiBoldStyle,
      titleLarge: AppStyles.semiBoldStyle,
      titleMedium: AppStyles.regularStyle,
      titleSmall: AppStyles.sebhaTextStyle,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.mainLightColor,

    ),
  );


  static ThemeData darkTheme = ThemeData(

    appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
    statusBarColor: AppColors.transparent,
    ),
  backgroundColor: AppColors.transparent,
    elevation: 0.0,
    centerTitle: true,
    titleTextStyle: AppStyles.appBarTextStyleDark,
    iconTheme: IconThemeData(
      color: AppColors.whiteAppColor,
    ),
  ),
    scaffoldBackgroundColor: AppColors.transparent,
    canvasColor: AppColors.mainDarkColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.shifting,
      backgroundColor: AppColors.mainDarkColor,
      selectedItemColor: AppColors.goldAppColor,
      unselectedItemColor: AppColors.whiteAppColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedLabelStyle: AppStyles.labelStyleDark,
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.goldAppColor,
      thickness: 3.0,
    ),
    iconTheme: IconThemeData(
      color: AppColors.goldAppColor
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.mainDarkColor,
      onPrimary: AppColors.goldAppColor,
      secondary: AppColors.mainDarkColor,
      onSecondary: AppColors.goldAppColor,
      error: AppColors.whiteAppColor,
      onError: AppColors.whiteAppColor,
      surface: AppColors.goldAppColor,
      onSurface: AppColors.blackAppColor,
    ),
    textTheme: TextTheme(
      headlineMedium: AppStyles.semiBoldStyleHadeethDark,
      bodyMedium: AppStyles.regularStyleContentDark,
      labelLarge: AppStyles.semiBoldStyleDark,
      titleLarge: AppStyles.semiBoldStyleDark,
      titleMedium: AppStyles.regularStyleDark,
      titleSmall: AppStyles.sebhaTextStyleDark,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.goldAppColor,

    ),

  );
}
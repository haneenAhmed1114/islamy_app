import 'package:flutter/cupertino.dart';
import 'package:islami_application/shared/utils/app_colors.dart';

abstract class AppStyles
{
  static const appBarTextStyle = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColors.blackAppColor,
    //fontFamily: 'El Messiri',
  );


  static const appBarTextStyleDark =TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w700,
      color: AppColors.whiteAppColor,
      //fontFamily: 'El Messiri'
  );

  static const semiBoldStyle = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: AppColors.blackAppColor,
  );
  static const semiBoldStyleDark = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteAppColor,
  );
  static const semiBoldStyleHadeeth = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: AppColors.blackAppColor,
  );
  static const semiBoldStyleHadeethDark = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color: AppColors.goldAppColor,
  );

  static const regularStyle = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.blackAppColor,
  );

  static const regularStyleDark = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteAppColor,
  );
  static const regularStyleContent = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.blackAppColor,
  );
  static const regularStyleContentDark = const TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w400,
    color: AppColors.goldAppColor,
  );

  static const TextStyle sebhaTextStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20.0,
    color: AppColors.whiteAppColor,
  );
  static const TextStyle sebhaTextStyleDark = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 20.0,
    color: AppColors.blackAppColor,
  );

  static const labelStyleDark = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.goldAppColor,
  );

  static const labelStyleLight = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.blackAppColor,
  );

}
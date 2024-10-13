import 'package:flutter/material.dart';
import 'package:islami_application/shared/utils/app_colors.dart';
import 'package:islami_application/shared/utils/app_styles.dart';


AppBar buildAppBar({String text = 'islami'})
{
  return AppBar(
    title: Text(
     text,
    ),
  );
}
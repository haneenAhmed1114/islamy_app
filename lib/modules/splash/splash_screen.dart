import 'package:flutter/material.dart';
import 'package:islami_application/modules/home/home_screen.dart';
import 'package:islami_application/shared/utils/app_colors.dart';
import 'package:islami_application/shared/utils/app_images_path.dart';
import 'package:islami_application/shared/utils/theme_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splashScreen';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = Provider.of<ThemeProvider>(context).isDark;
    Future.delayed(Duration(seconds:2),() {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    },);
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image(
          image: AssetImage(
            isDark
                ? AppAssets.splashDarkScreen
                : AppAssets.splashLightScreen,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

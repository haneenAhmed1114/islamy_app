import 'package:flutter/material.dart';
import 'package:islami_application/modules/hadeeth/hadeeth_screen.dart';
import 'package:islami_application/modules/quran/quran_screen.dart';
import 'package:islami_application/modules/radio/radio_screen.dart';
import 'package:islami_application/modules/sebha/sebha_screen.dart';
import 'package:islami_application/modules/settings/settings_screen.dart';
import 'package:islami_application/shared/components/app_bar_component.dart';
import 'package:islami_application/shared/utils/app_colors.dart';
import 'package:islami_application/shared/utils/app_images_path.dart';
import 'package:islami_application/shared/utils/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeScreen extends StatefulWidget {

  static const String routeName =  'homeScreen';

   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0 ;
  List<Widget> screens = [
    QuranScreen(),
    HadeethScreen(),
    SebhaScreen(),
    RadioScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            !Provider.of<ThemeProvider>(context).isDark ?
            AppAssets.mainLightBackground : AppAssets.mainDarkBackground,
          ),
          fit: BoxFit.cover
        )
      ),
      child: Scaffold(
         extendBodyBehindAppBar: true,
         appBar: buildAppBar(text:  AppLocalizations.of(context)!.islami) ,
        bottomNavigationBar: buildBottomNavigationBar(),
        body: screens[currentIndex],

      ),
    );
  }

  Widget buildBottomNavigationBar()
  {
    return BottomNavigationBar(

        currentIndex: currentIndex ,
        onTap: (value) {
          currentIndex = value ;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon:ImageIcon(
                AssetImage(
                  AppAssets.quranIcon,
                ),
              ),
          label: 'Quran',),
          BottomNavigationBarItem(
            icon:ImageIcon(
              AssetImage(
                AppAssets.hadeethIcon,
              ),
            ),
            label: 'Hadeeth',),
          BottomNavigationBarItem(
              icon:ImageIcon(AssetImage(AppAssets.sebhaIcon),),label: 'Sebha', ),
          BottomNavigationBarItem(
            icon:ImageIcon(AssetImage(AppAssets.radioIcon),),label: 'Radio', ),
          BottomNavigationBarItem(
            icon:Icon(Icons.settings,color: AppColors.whiteAppColor,),
            label: 'Settings', ),
        ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:islami_application/models/hadeeth_model.dart';
import 'package:islami_application/shared/utils/theme_provider.dart';
import 'package:provider/provider.dart';
import '../../shared/components/app_bar_component.dart';
import '../../shared/utils/app_colors.dart';
import '../../shared/utils/app_images_path.dart';

class HadeethDetail extends StatefulWidget {
  static const String routeName ='hadeethDetails';
  const HadeethDetail({super.key});

  @override
  State<HadeethDetail> createState() => _HadeethDetailState();
}

class _HadeethDetailState extends State<HadeethDetail> {
  @override
  Widget build(BuildContext context) {
    {
      var isDark = Provider.of<ThemeProvider>(context).isDark;
      HadeethModel hadeethModel = ModalRoute.of(context)!.settings.arguments as HadeethModel;

      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
           isDark?AppAssets.mainDarkBackground:AppAssets.mainLightBackground,
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar : buildAppBar(),
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width*0.09,
              vertical: MediaQuery.of(context).size.height*0.02,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width*0.06,
              vertical: MediaQuery.of(context).size.height*0.06,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.85),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(hadeethModel.hadeethName,style: Theme.of(context).textTheme.headlineMedium,),
                Divider(
                  indent: MediaQuery.of(context).size.width*0.09,
                  endIndent: MediaQuery.of(context).size.width*0.09,
                  color: Theme.of(context).dividerTheme.color,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      hadeethModel.hadeethContent,
                      style: Theme.of(context).textTheme.bodyMedium,
                      // textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
              ],
            ),

          ),
          //body: suraContent.isEmpty ? Center(child: CircularProgressIndicator(color:AppColors.accent,)) : Text(suraContent),
        ),
      );
    }
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/models/sura_model.dart';
import 'package:islami_application/shared/utils/theme_provider.dart';
import 'package:provider/provider.dart';
import '../../shared/components/app_bar_component.dart';
import '../../shared/utils/app_images_path.dart';
import '../../shared/utils/app_styles.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'sura_details';

  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final SuraModel? args = ModalRoute.of(context)?.settings.arguments as SuraModel?;
      if (args != null) {
        readSuraFile(args.fileName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDark = Provider.of<ThemeProvider>(context).isDark;
    final SuraModel? args = ModalRoute.of(context)?.settings.arguments as SuraModel?;

    if (args == null) {
      return Scaffold(
        appBar: buildAppBar(),
        body: Center(
          child: Text('No Sura data provided', style: AppStyles.regularStyle),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            isDark
                ? AppAssets.mainDarkBackground
                : AppAssets.mainLightBackground,
          ),
        ),
      ),
      child: Scaffold(
        appBar: buildAppBar(),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.09,
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06,
            vertical: MediaQuery.of(context).size.height * 0.06,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.85),
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('${args.suraName}', style:Theme.of(context).textTheme.headlineMedium),
              Divider(
                indent: MediaQuery.of(context).size.width * 0.09,
                endIndent: MediaQuery.of(context).size.width * 0.09,
                color: Theme.of(context).dividerTheme.color,
              ),
              verses.isEmpty
                  ? Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).progressIndicatorTheme.color,
                  ),
                ),
              )
                  : Expanded(
                child: ListView.builder(
                  itemCount: verses.length,
                  itemBuilder: (context, index) {
                    return RichText(
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(text: verses[index]),
                          TextSpan(
                            text: ' (${index + 1})',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> readSuraFile(String fileName) async {
    String suraContent = await rootBundle.loadString('assets/quran_files/$fileName');
    setState(() {
      verses = suraContent.trim().split('\n');
    });
  }
}


import 'package:flutter/material.dart';
import 'package:islami_application/models/sura_model.dart';
import 'package:islami_application/modules/quran/sura_content.dart';
import 'package:islami_application/shared/constants/sura_name_num.dart';
import 'package:islami_application/shared/utils/app_images_path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class QuranScreen extends StatelessWidget {
  const QuranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 70.0,
            bottom: 12.0
          ),
          child: Image(
            image: AssetImage(
              AppAssets.quranLogo,
            ),
          ),
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.center,
          children: [
            Column(
              children: [
                Divider(
                  color: Theme.of(context).dividerTheme.color,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.suraname,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          AppLocalizations.of(context)!.versesnum,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Theme.of(context).dividerTheme.color,
                  height: 0.0,
                ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(0.0),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(SuraDetails.routeName,arguments: SuraModel( suraName: Constants.suraNames[index],fileName: '${index+1}.txt'),);
                        },
                        child: Row(
                          children: [
                            Expanded(child: Text(Constants.suraNames[index],style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,),),
                            Expanded(child: Text(Constants.versesNumber[index].toString(),style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,),
                            ),],
                        ),
                      ),
                      separatorBuilder: (context, index) =>  Divider(
                        color: Theme.of(context).dividerTheme.color,
                        thickness: 2.0,
                      ),
                      itemCount: Constants.suraNames.length,
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: VerticalDivider(
                color: Theme.of(context).dividerTheme.color,
                thickness: 3.0,
              ),
            ),
          ],
          ),
        ),
      ],
    );
  }


}

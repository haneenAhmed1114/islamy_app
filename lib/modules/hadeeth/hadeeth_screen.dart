import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/models/hadeeth_model.dart';
import 'package:islami_application/modules/hadeeth/hadeeth_detail.dart';
import 'package:islami_application/shared/utils/app_images_path.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadeethScreen extends StatefulWidget {
  const HadeethScreen({super.key});

  @override
  State<HadeethScreen> createState() => _HadeethScreenState();
}

class _HadeethScreenState extends State<HadeethScreen> {
  List<HadeethModel> hadeethModelList = [];
  @override
  Widget build(BuildContext context) {
    if(hadeethModelList.isEmpty)
      {
        loadHadeethFile();
      }
    return Column(
      children: [
         Padding(
           padding: const EdgeInsets.only(
             top: 80.0,
           ),
           child: Image(image:AssetImage(AppAssets.hadeethLogo), ),
         ),
         Divider(color: Theme.of(context).dividerTheme.color,),
         Padding(
           padding: const EdgeInsets.symmetric(
             vertical: 10.0
           ),
           child: Text(AppLocalizations.of(context)!.hadeeth,style: Theme.of(context).textTheme.titleLarge,),
         ),
         Divider(color: Theme.of(context).dividerTheme.color,),
         Expanded(
          child: ListView.separated(
            padding: EdgeInsets.all(0.0),
              itemBuilder: (context, index) => InkWell(child: Text(hadeethModelList[index].hadeethName,style: Theme.of(context).textTheme.titleMedium,textAlign: TextAlign.center,),
              onTap: () {
                Navigator.of(context).pushNamed(HadeethDetail.routeName,arguments: hadeethModelList[index]);
              },),
            separatorBuilder: (context, index) =>  Divider(
              color: Theme.of(context).dividerTheme.color,
              thickness: 2.0,
            ),
            itemCount: hadeethModelList.length,
          ),
        ),
      ],
    );
  }

 Future<void> loadHadeethFile()async
  {
    List<HadeethModel> _hadeethModelList = [];
   String data = await rootBundle.loadString('assets/hadeeth/ahadeth.txt'); // read the all file
   List<String> hadeethList = data.trim().split('#');          // in each item has the name & content of hadeeth
   hadeethList.removeWhere((element) => element.trim().isEmpty,);
   for(var i = 0 ; i < hadeethList.length ; i++)
     {
        int index = hadeethList[i].trim().indexOf('\n'); // to know the index of the last of the name of hadeeth
        String name = hadeethList[i].trim().substring(0,index);   // the name of hadeeth
       String content = hadeethList[i].trim().substring(index);  // the content of hadeeth
       print('name of hadeeth is $name');
       print('content of hadeethis $content');
       _hadeethModelList.add(HadeethModel(hadeethName: name, hadeethContent: content));
     }
   hadeethModelList=_hadeethModelList;
   setState(() {

   });
  }
}

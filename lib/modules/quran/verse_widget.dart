import 'package:flutter/material.dart';
import 'package:islami_application/shared/utils/app_styles.dart';

class VerseWidget extends StatelessWidget {
  String verse ;
   VerseWidget({super.key,required this.verse});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey,
      elevation: 18.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 4.0,
        ),
        child: Text(verse,textAlign: TextAlign.center,style: AppStyles.regularStyle,textDirection: TextDirection.rtl,),
      ),
    );
  }
}

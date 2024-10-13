import 'package:flutter/material.dart';
import 'package:islami_application/shared/utils/app_colors.dart';
import 'package:islami_application/shared/utils/app_images_path.dart';
import 'package:islami_application/shared/utils/app_styles.dart';
class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              image: AssetImage(
                AppAssets.radioLogo,
              ),
            height: 170.0,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 30.0,
          ),
          Text('إذاعة القرآن الكريم',style: Theme.of(context).textTheme.labelLarge,),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {

              } , icon: Icon(Icons.skip_previous,color: Theme.of(context).iconTheme.color,size: 50,),),
              SizedBox(width: 30.0,),
              IconButton(onPressed: () {

              } , icon: Icon(Icons.play_circle_fill,color: Theme.of(context).iconTheme.color,size:60.0,),),
              SizedBox(width: 30.0,),
              IconButton(onPressed: () {

              } , icon: Icon(Icons.skip_next,color: Theme.of(context).iconTheme.color , size: 50,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

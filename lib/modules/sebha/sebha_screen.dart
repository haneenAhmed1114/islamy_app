import 'package:flutter/material.dart';
import 'package:islami_application/shared/utils/app_images_path.dart';
import 'package:provider/provider.dart';
import '../../shared/utils/theme_provider.dart';

class SebhaScreen extends StatefulWidget {
  SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  int totalCounter = 0;
  int currentIndex = 0;
  double rotateAngle = 0.0 ;

  List<String> bakeatSalehat = ['سبحان الله', 'الحمد لله', 'لا إله إلا الله', 'الله أكبر'];

  @override
  Widget build(BuildContext context) {
    var isDark = Provider.of<ThemeProvider>(context).isDark;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: rotateAngle,
            child: Image(
              height: 170.0,
              image: AssetImage(
                !isDark?
                AppAssets.sebhaLogo : AppAssets.sebhaIconDark,
              ),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              bottom: 20.0,
            ),
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.surface,
              radius: 25,
              child: Text(
                '$counter',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: MaterialButton(
              onPressed: () {
                incrementCounter();
              },
              child: Text(
                bakeatSalehat[currentIndex],
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
          ),
          SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      counterEqualZero();
                    },
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Reset',
                      //AppLocalizations.of(context)!.reset,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5.0,),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'total : $totalCounter',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  void incrementCounter() {
    setState(() {
      counter++;
      totalCounter++;
      rotateAngle += 0.1;

      if (counter == 33) {
        counter = 0;
        currentIndex = (currentIndex + 1) % bakeatSalehat.length;
      }
    });
  }

  void counterEqualZero() {
    setState(() {
      counter = 0;
      currentIndex = 0;
      totalCounter = 0;
      rotateAngle=0.0;
    });
  }
}


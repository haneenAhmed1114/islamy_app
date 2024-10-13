import 'package:flutter/material.dart';
import 'package:islami_application/shared/utils/app_colors.dart';
import 'package:islami_application/shared/utils/app_styles.dart';
import 'package:islami_application/shared/utils/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    var provider =  Provider.of<ThemeProvider>(context) ;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SwitchListTile(
            title: Text(
              AppLocalizations.of(context)!.darktheme,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            activeColor: AppColors.amberColor,
            activeTrackColor: AppColors.goldAppColor,
           // inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.grey,
            thumbColor: WidgetStatePropertyAll(AppColors.whiteAppColor),
            value: provider.isDark,
              onChanged: (value) {
             provider.changeThemeMode(value?ThemeMode.dark : ThemeMode.light);
              },),
          ListTile(
            title: Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            trailing: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.whiteAppColor,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: DropdownButton<String>(
                underline: Container(),
                value: provider.localCode,
                dropdownColor: Colors.grey,
                borderRadius: BorderRadius.circular(20.0),
                items: [
                  DropdownMenuItem(child: Text('English'),value: 'en',),
                  DropdownMenuItem(child: Text('عربي'),value: 'ar', ),
                ],
                onChanged: (value) {
                  if(value!=null)
                    {
                      provider.changeAppLocal(value);

                    }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zikirdua/constants/colors.dart';
import 'package:zikirdua/dark_mode/dark_theme_provider.dart';
import 'package:zikirdua/widgets/app_version.dart';
import 'package:zikirdua/widgets/drawer_name.dart';

class MyDrawer extends StatelessWidget {
  myListTile(
    BuildContext context,
    double height,
    IconData tileIcon,
    String title,
    String pushName,
    Color? color,
  ) {
    return Card(
      color: color,
      child: ListTile(
        leading: Icon(tileIcon, size: height * 0.035),
        title: Text(title),
        onTap: () => Navigator.pushNamed(context, pushName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * 0.835,
      height: height,
      child: Material(
        color: themeChange.darkTheme ? teal800 : white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DrawerAppName(),
              Column(
                children: [
                  myListTile(
                    context,
                    height,
                    Icons.format_list_numbered,
                    "En Güzel Dualar",
                    "/duaList",
                    themeChange.darkTheme ? teal700 : white,
                  ),
                  myListTile(
                    context,
                    height,
                    Icons.help,
                    "Yardım Rehberi",
                    "/help",
                    themeChange.darkTheme ? teal700 : white,
                  ),
                  myListTile(
                    context,
                    height,
                    Icons.share,
                    "Uygulamayı Paylaş",
                    "/shareApp",
                    themeChange.darkTheme ? teal700 : white,
                  ),
                ],
              ),
              AppVersion()
            ],
          ),
        ),
      ),
    );
  }
}

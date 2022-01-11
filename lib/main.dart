import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zikirdua/dark_mode/dark_theme_provider.dart';
import 'package:zikirdua/dark_mode/theme_style.dart';
import 'package:zikirdua/other_view/help.dart';
import 'package:zikirdua/other_view/share_app.dart';
import 'package:zikirdua/screens/allah_list.dart';
import 'package:zikirdua/screens/dua_list.dart';
import 'package:zikirdua/screens/home_screen.dart';
import 'package:zikirdua/screens/my_drawer.dart';
import 'package:zikirdua/screens/splash.dart';
import 'package:zikirdua/screens/zikir_matik.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider darkThemeProvider = DarkThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  void getCurrentAppTheme() async {
    darkThemeProvider.darkTheme =
        await darkThemeProvider.darkThemePref.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider(
      create: (_) {
        return darkThemeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return GetMaterialApp(
            title: "En Güzel Dualar",
            debugShowCheckedModeBanner: false,
            theme: ThemeStyles.themeData(darkThemeProvider.darkTheme, context),
            home: Builder(
              builder: (context) => Splash(),
            ),
            initialRoute: initScreen == 0 || initScreen == null
                ? '/homeScreen'
                : '/splash',
            routes: <String, WidgetBuilder>{
              '/zikirMatik': (context) => ZikirMatik(),
              '/duaList': (context) => DuaList(),
              '/allahList': (context) => AllahList(),
              '/myDrawer': (context) => MyDrawer(),
              '/shareApp': (context) => ShareApp(),
              '/splash': (context) => Splash(),
              '/help': (context) => Help(),
              '/homeScreen': (context) => HomeScreen(
                    maxSlide: MediaQuery.of(context).size.width * 0.835,
                  ),
            },
          );
        },
      ),
    );
  }
}

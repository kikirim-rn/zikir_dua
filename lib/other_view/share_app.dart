import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zikirdua/constants/colors.dart';
import 'package:zikirdua/dark_mode/dark_theme_provider.dart';
import 'package:zikirdua/screens/my_drawer.dart';
import 'package:zikirdua/widgets/app_version.dart';

class ShareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeChange.darkTheme ? teal900 : white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            ShareBackBtn(),
            CustomTitle(
              title: 'Uygulamayı Paylaş',
            ),
            ShareInfo()
          ],
        ),
      ),
    );
  }
}

class ShareInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: height * 0.13),
          themeChange.darkTheme
              ? Image.asset(
                  'assets/images/allah.png',
                  height: height * 0.13,
                  color: grey400,
                )
              : Image.asset('assets/images/allahs.png', height: height * 0.13),
          SizedBox(height: height * 0.02),
          Text("ZikirDua Uygulaması GitHub'da Açık Kaynak olarak'da mevcuttur!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption),
          SizedBox(height: height * 0.05),
          GitHubRepoBtn(),
          ShareAppBtn(),
          RateFeedBackBtn(),
          SizedBox(height: height * 0.02),
          AppVersion()
        ],
      ),
    );
  }
}

class GitHubRepoBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.055,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: themeChange.darkTheme ? blue900 : grey400,
            padding: EdgeInsets.all(5.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/github.png",
                color: themeChange.darkTheme ? white : black,
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                ' GitHub Repo',
                style: TextStyle(
                  color: themeChange.darkTheme ? white : black,
                  fontFamily: 'FiraSans',
                ),
              ),
            ],
          ),
          onPressed: () => launch("https://github.com/kikirim-rn/ZikirDua"),
        ),
      ),
    );
  }
}

class ShareAppBtn extends StatefulWidget {
  @override
  _ShareAppBtnState createState() => _ShareAppBtnState();
}

class _ShareAppBtnState extends State<ShareAppBtn> {
  String text = Platform.isAndroid
      ? "Play Store'daki en son ZikirDua Uygulamasını indirin\n\n"
          "https://play.google.com/store/apps/details?id=com.hmz.al_quran \n\nDaha Fazlasını Paylaşın! :)"
      : "App Store'daki en son ZikirDua Uygulamasını indirin\n\n"
          "https://apps.apple.com/tr/app/zikir-dua/id1535629222?l=tr \n\nDaha Fazlasını Paylaşın! :)";

  void _onShare(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(text,
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.055,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: themeChange.darkTheme ? pink800 : pink100,
            padding: EdgeInsets.all(5.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.share,
                size: MediaQuery.of(context).size.height * 0.03,
                color: themeChange.darkTheme ? white : black,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                ' Uygulamayı Paylaş',
                style: TextStyle(
                  color: themeChange.darkTheme ? white : black,
                  fontFamily: 'FiraSans',
                ),
              ),
            ],
          ),
          onPressed: () => _onShare(context),
        ),
      ),
    );
  }
}

class RateFeedBackBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.055,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: themeChange.darkTheme ? green800 : green100,
              padding: EdgeInsets.all(5.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Platform.isAndroid
                      ? "assets/images/googleplay.png"
                      : "assets/images/appstore.png",
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  ' Puan ve Geribildirim',
                  style: TextStyle(
                    color: themeChange.darkTheme ? white : black,
                    fontFamily: 'FiraSans',
                  ),
                ),
              ],
            ),
            onPressed: () {
              if (Platform.isAndroid) {
                LaunchReview.launch(
                    androidAppId:
                        "http://kikirim.blogspot.com/p/zikir-dualar.html");
              } else if (Platform.isIOS) {
                LaunchReview.launch(
                    iOSAppId:
                        "https://apps.apple.com/us/app/zikirdua/id1535629222");
              }
            }),
      ),
    );
  }
}

class CustomTitle extends StatelessWidget {
  final String? title;

  CustomTitle({this.title});
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Positioned(
      top: height * 0.16,
      left: width * 0.06,
      child: Shimmer.fromColors(
        baseColor: themeChange.darkTheme ? white : black,
        highlightColor: themeChange.darkTheme ? grey : green,
        enabled: true,
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
                fontFamily: 'FiraSans',
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class ShareBackBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 20,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back,
        ),
        splashColor: Color(0xff04364f),
        iconSize: MediaQuery.of(context).size.height * 0.04,
        tooltip: 'Back Button',
        onPressed: () {
          Get.back(result: () => MyDrawer());
        },
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:zikirdua/animations/bottom_animation.dart';
import 'package:zikirdua/components/flare.dart';
import 'package:zikirdua/components/loading_shimmer.dart';
import 'package:zikirdua/constants/colors.dart';
import 'package:zikirdua/dark_mode/dark_theme_provider.dart';
import 'package:zikirdua/widgets/back_btn.dart';
import 'package:zikirdua/widgets/custom_image.dart';

class AllahList extends StatefulWidget {
  AllahList({Key? key}) : super(key: key);

  @override
  _AllahListState createState() => _AllahListState();
}

class _AllahListState extends State<AllahList> {
  late List<dynamic> data;

  @override
  void initState() {
    super.initState();
    _loadData().then((value) {
      setState(() {
        data = value;
      });
    });
  }

  Future<List<dynamic>> _loadData() async {
    String jsonString = await rootBundle.loadString('json/allah.json');
    return json.decode(jsonString).toList();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: themeChange.darkTheme ? teal900 : white,
      body: SafeArea(
        child: Stack(
          children: [
            FutureBuilder(
              future: _loadData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return LoadingShimmer(
                    text: "Allah'ın İsimleri",
                  );
                } else if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasData) {
                  return Center(
                      child: Text(
                          "Bağlantı Hatası! Lütfen daha sonra tekrar deneyiniz :)"));
                } else if (snapshot.hasData == null) {
                  return Center(
                      child: Text(
                          "Bağlantı Hatası! Lütfen İnternet Bağlantınızı Kontrol Ediniz"));
                } else if (snapshot.hasError) {
                  return Center(
                      child: Text(
                    "Bizim tarafımızda bir şeyler ters gitti!\nYeniden bağlanmaya çalışıyoruz :)",
                    textAlign: TextAlign.center,
                  ));
                } else if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.fromLTRB(0, height * 0.2, 0, 0),
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: divider,
                          height: 2.0,
                        );
                      },
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return WidgetAnimator(
                          ListTile(
                            title: Card(
                              color: themeChange.darkTheme ? teal900 : white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${data[index]["name"]}", // Listedeki dizi isimleri
                                    style: TextStyle(
                                      fontFamily: 'FiraSans',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "${data[index]["descp"]}", // Listedeki dizi isimleri
                                    style: TextStyle(
                                      fontFamily: 'FiraSans',
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                        "Bağlantı Hatası! Lütfen daha sonra tekrar deneyiniz"),
                  );
                }
              },
            ),
            CustomImage(
              opacity: themeChange.darkTheme ? 0.7 : 0.5,
              height: height * 0.15,
              image: themeChange.darkTheme
                  ? ('assets/images/allah.png').toString()
                  : ('assets/images/allahs.png').toString(),
            ),
            BackBtn(),
            CustomTitle(
              title: "Allah'ın İsimleri",
            ),
            themeChange.darkTheme
                ? Flare(
                    color: flare,
                    offset: Offset(width, -height),
                    bottom: -50,
                    flareDuration: Duration(seconds: 17),
                    left: 100,
                    height: 60,
                    width: 60,
                  )
                : Container(),
            themeChange.darkTheme
                ? Flare(
                    color: flare,
                    offset: Offset(width, -height),
                    bottom: -50,
                    flareDuration: Duration(seconds: 12),
                    left: 10,
                    height: 25,
                    width: 25,
                  )
                : Container(),
            themeChange.darkTheme
                ? Flare(
                    color: flare,
                    offset: Offset(width, -height),
                    bottom: -40,
                    left: -100,
                    flareDuration: Duration(seconds: 18),
                    height: 50,
                    width: 50,
                  )
                : Container(),
            themeChange.darkTheme
                ? Flare(
                    color: flare,
                    offset: Offset(width, -height),
                    bottom: -50,
                    left: -80,
                    flareDuration: Duration(seconds: 15),
                    height: 50,
                    width: 50,
                  )
                : Container(),
            themeChange.darkTheme
                ? Flare(
                    color: flare,
                    offset: Offset(width, -height),
                    bottom: -20,
                    left: -120,
                    flareDuration: Duration(seconds: 12),
                    height: 40,
                    width: 40,
                  )
                : Container(),
          ],
        ),
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

import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zikirdua/components/allah_btn.dart';
import 'package:zikirdua/components/dua_btn.dart';
import 'package:zikirdua/components/zikir_btn.dart';
import 'package:zikirdua/constants/colors.dart';
import 'package:zikirdua/dark_mode/dark_theme_provider.dart';
import 'package:zikirdua/screens/my_drawer.dart';
import 'package:zikirdua/widgets/app_name.dart';
import 'package:zikirdua/widgets/custom_image.dart';
import 'package:zikirdua/widgets/quran_rail.dart';

class HomeScreen extends StatefulWidget {
  final double maxSlide;
  HomeScreen({required this.maxSlide});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  late bool _canBeDragged;

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = animationController.isDismissed;
    bool isDragCloseFromRight = animationController.isCompleted;
    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta! / widget.maxSlide;
      animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    double _kMinFlingVelocity = 365.0;

    if (animationController.isDismissed || animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      animationController.fling(velocity: visualVelocity);
    } else if (animationController.value < 0.5) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  Future<bool> _onWillPop() async {
    return (await (showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: new Text(
              "Uygulamadan Çık",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: new Text("Emin misin?"),
            actions: [
              TextButton(
                child: Text(
                  'Evet',
                  style: TextStyle(
                    color: red,
                  ),
                ),
                style: TextButton.styleFrom(
                  shape: StadiumBorder(),
                ),
                onPressed: () {
                  exit(0);
                },
              ),
              TextButton(
                child: Text(
                  'Hayır',
                  style: TextStyle(color: blue),
                ),
                style: TextButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ) as FutureOr<bool>?)) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        onHorizontalDragStart: _onDragStart,
        onHorizontalDragUpdate: _onDragUpdate,
        onHorizontalDragEnd: _onDragEnd,
        behavior: HitTestBehavior.translucent,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return Material(
              color: themeChange.darkTheme ? teal900 : white70,
              child: SafeArea(
                child: Stack(
                  children: [
                    Transform.translate(
                      offset: Offset(
                          widget.maxSlide * (animationController.value - 1), 0),
                      child: Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(
                              math.pi / 2 * (1 - animationController.value)),
                        alignment: Alignment.centerRight,
                        child: MyDrawer(),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(
                          widget.maxSlide * animationController.value, 0),
                      child: Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(-math.pi / 2 * animationController.value),
                          alignment: Alignment.centerLeft,
                          child: MainScreen()),
                    ),
                    Positioned(
                      top: 4.0 + MediaQuery.of(context).padding.top,
                      left: width * 0.01 +
                          animationController.value * widget.maxSlide,
                      child: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: toggle,
                        color: themeChange.darkTheme ? white : black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: MediaQuery.of(context).size.width,
      color: themeChange.darkTheme ? teal900 : white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AppName(),
          CustomImage(
            opacity: themeChange.darkTheme ? 0.7 : 0.5,
            height: height * 0.15,
            image: themeChange.darkTheme
                ? ('assets/images/allah.png').toString()
                : ('assets/images/allahs.png').toString(),
          ),
          QuranRail(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [DuaBtn(), AllahBtn(), ZikirBtn()],
            ),
          ),
          DuaBottom(),
        ],
      ),
    );
  }
}

class DuaBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "\"Gönülden yalvararak, korku ile ve yüksek olmayan bir sesle, sabah ve akşam Rabbini zikret. Sakın gafillerden olma!\"\n",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'FiraSans', fontSize: size.height * 0.018),
          ),
          Text(
            "A'râf 205\n",
            style: TextStyle(
                fontFamily: 'FiraSans', fontSize: size.height * 0.018),
          ),
        ],
      ),
    );
  }
}

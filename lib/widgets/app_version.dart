import 'package:flutter/material.dart';

class AppVersion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "En Güzel Dualar",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'FiraSans',
                fontSize: MediaQuery.of(context).size.height * 0.020),
          ),
          Text(
            "Versiyon: 2.0.4\n",
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.015),
          )
        ],
      ),
    );
  }
}

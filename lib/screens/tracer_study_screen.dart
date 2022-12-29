import 'package:alumnews/utils/colors.dart';
import 'package:alumnews/utils/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TracerStudyScreen extends StatefulWidget {
  const TracerStudyScreen({Key? key}) : super(key: key);

  @override
  State<TracerStudyScreen> createState() => _TracerStudyScreenState();
}

class _TracerStudyScreenState extends State<TracerStudyScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor:
            width > webScreenSize ? webBackgroundColor : mobileBackgroundColor,
        appBar: width > webScreenSize
            ? null
            : AppBar(
                backgroundColor: mobileBackgroundColor,
                centerTitle: false,
                title: SvgPicture.asset(
                  'assets/alumnews_payung.svg',
                  height: 32,
                ),
              ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: const <Widget>[
            ListTile(
              title: Text('Tracer Study 2021'),
              tileColor: greenColor,
            ),
            ListTile(
              title: Text('Tracer Study 2022'),
              tileColor: greenColor,
            ),
          ],
        ));
  }
}

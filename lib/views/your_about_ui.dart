import 'package:flutter/material.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({Key? key}) : super(key: key);

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
    );
  }
}

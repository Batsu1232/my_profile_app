import 'package:flutter/material.dart';

class NameUI extends StatefulWidget {
  const NameUI({Key? key}) : super(key: key);

  @override
  State<NameUI> createState() => _NameUIState();
}

class _NameUIState extends State<NameUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
    );
  }
}

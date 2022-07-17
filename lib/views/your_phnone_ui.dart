import 'package:flutter/material.dart';

class PhoneUI extends StatefulWidget {
  const PhoneUI({Key? key}) : super(key: key);

  @override
  State<PhoneUI> createState() => _PhoneUIState();
}

class _PhoneUIState extends State<PhoneUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
    );
  }
}

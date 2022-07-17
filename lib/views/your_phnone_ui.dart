import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneUI extends StatefulWidget {
  const PhoneUI({Key? key}) : super(key: key);

  @override
  State<PhoneUI> createState() => _PhoneUIState();
}

class _PhoneUIState extends State<PhoneUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Add/Edit Phone',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "ป้อนชื่อของคุณ",
              style: GoogleFonts.itim(
                fontSize: 35.0,
                color: Colors.pinkAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ป้อนเบอร์โทรศัพท์',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "บันทึก",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  MediaQuery.of(context).size.width * 0.7,
                  50,
                ),
                primary: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailUI extends StatefulWidget {
  const EmailUI({Key? key}) : super(key: key);

  @override
  State<EmailUI> createState() => _EmailUIState();
}

class _EmailUIState extends State<EmailUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Add/Edit Email',
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
                color: Colors.indigo,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ป้อนอีเมล์',
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
                primary: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

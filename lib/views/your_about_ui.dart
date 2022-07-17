import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({Key? key}) : super(key: key);

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  TextEditingController aboutCtrl = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text(
          'Add/Edit About',
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
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
                color: Colors.greenAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: TextField(
                controller: aboutCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ป้อนข้อมูล',
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
              onPressed: () {
                if (aboutCtrl.text.trim().length == 0) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'คำเตือน',
                        ),
                        content: Text(
                          'ป้อนข้อมูลต่างๆของคุณด้วย',
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'ตกลง',
                            ),
                          ),
                        ],
                      );
                    },
                  );
                } else {}
              },
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
                primary: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

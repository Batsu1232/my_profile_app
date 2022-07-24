import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailUI extends StatefulWidget {
  const EmailUI({Key? key}) : super(key: key);

  @override
  State<EmailUI> createState() => _EmailUIState();
}

class _EmailUIState extends State<EmailUI> {
  TextEditingController emailCtrl = TextEditingController(text: '');
  Future addYourEmailToSF() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('youremail', emailCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          'Add/Edit Email',
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
              "ป้อนอีเมล์ของคุณ",
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
                controller: emailCtrl,
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
              onPressed: () {
                if (emailCtrl.text.trim().length == 0) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'คำเตือน',
                        ),
                        content: Text(
                          'ป้อนอีเมล์ของคุณด้วย',
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
                } else {
                  addYourEmailToSF().then((value) {
                    Navigator.pop(context);
                  });
                }
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
                primary: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

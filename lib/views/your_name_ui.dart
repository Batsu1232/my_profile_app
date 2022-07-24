import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameUI extends StatefulWidget {
  const NameUI({Key? key}) : super(key: key);

  @override
  State<NameUI> createState() => _NameUIState();
}

class _NameUIState extends State<NameUI> {
  TextEditingController nameCtrl = TextEditingController(text: '');
  Future addYourNameToSF() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('yourname', nameCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Add/Edit Name',
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
                color: Colors.orange,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
              ),
              child: TextField(
                controller: nameCtrl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ป้อนชื่อ',
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
                if (nameCtrl.text.trim().length == 0) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'คำเตือน',
                        ),
                        content: Text(
                          'ป้อนชื่อของคุณด้วย',
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
                  addYourNameToSF().then((value) {
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
                primary: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

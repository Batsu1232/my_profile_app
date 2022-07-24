import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PhoneUI extends StatefulWidget {
  const PhoneUI({Key? key}) : super(key: key);

  @override
  State<PhoneUI> createState() => _PhoneUIState();
}

class _PhoneUIState extends State<PhoneUI> {
  TextEditingController phoneCtrl = TextEditingController(text: '');
  Future addYourPhoneToSF() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('yourphone', phoneCtrl.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          'Add/Edit Phone',
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
              "ป้อนเบอร์โทรศัพท์ของคุณ",
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
                controller: phoneCtrl,
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
              onPressed: () {
                if (phoneCtrl.text.trim().length == 0) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'คำเตือน',
                        ),
                        content: Text(
                          'ป้อนเบอร์โทรของคุณด้วย',
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
                  addYourPhoneToSF().then((value) {
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
                primary: Colors.pinkAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

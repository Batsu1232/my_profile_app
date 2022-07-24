import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_profile_app/views/your_about_ui.dart';
import 'package:my_profile_app/views/your_email_ui.dart';
import 'package:my_profile_app/views/your_name_ui.dart';
import 'package:my_profile_app/views/your_phone_ui.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  TextEditingController yournameCtrl = TextEditingController(text: '');
  TextEditingController yourphoneCtrl = TextEditingController(text: '');
  TextEditingController youremailCtrl = TextEditingController(text: '');
  TextEditingController youraboutCtrl = TextEditingController(text: '');

  File? _image;

  getImageFromCameraAndSaveToSF() async {
    XFile? pickImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickImage != null) {
      setState(() {
        _image = File(pickImage.path);
      });
    }

    Directory imageDir = await getApplicationDocumentsDirectory();
    String imagePath = imageDir.path;
    var imageName = basename(pickImage!.path);
    File localImage = await File(pickImage.path).copy('$imagePath/$imageName');

    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('yourimage', localImage.path);
  }

  getImageFromGalleryAndSaveToSF() async {
    XFile? pickImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickImage != null) {
      setState(() {
        _image = File(pickImage.path);
      });
    }

    Directory imageDir = await getApplicationDocumentsDirectory();
    String imagePath = imageDir.path;
    var imageName = basename(pickImage!.path);
    File localImage = await File(pickImage.path).copy('$imagePath/$imageName');

    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('yourimage', localImage.path);
  }

  check_and_show_data() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    bool mynameKey = prefer.containsKey('yourname');
    bool myphoneKey = prefer.containsKey('yourphone');
    bool myemailKey = prefer.containsKey('youremail');
    bool myaboutKey = prefer.containsKey('yourabout');
    bool myimageKey = prefer.containsKey('yourimage');

    if (mynameKey == true) {
      setState(() {
        yournameCtrl.text = prefer.getString('yourname')!;
      });
    }
    if (myphoneKey == true) {
      setState(() {
        yourphoneCtrl.text = prefer.getString('yourphone')!;
      });
    }
    if (myemailKey == true) {
      setState(() {
        youremailCtrl.text = prefer.getString('youremail')!;
      });
    }
    if (myaboutKey == true) {
      setState(() {
        youraboutCtrl.text = prefer.getString('yourabout')!;
      });
    }

    if (myimageKey == true) {
      _image = File(prefer.getString('yourimage')!);
    }
  }

  @override
  void initState() {
    check_and_show_data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'My Profile',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image == null
                      ? Container(
                          height: MediaQuery.of(context).size.width * 0.5,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.green,
                              width: 5.0,
                            ),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/myprofile.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.width * 0.5,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.green,
                              width: 5.0,
                            ),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: FileImage(
                                _image!,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  IconButton(
                    onPressed: () {
                      getImageFromCameraAndSaveToSF();
                    },
                    icon: Icon(
                      Icons.camera_alt_rounded,
                      size: MediaQuery.of(context).size.width * 0.08,
                      color: Colors.green[800],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 35.0,
                  left: 35.0,
                ),
                child: TextField(
                  controller: yournameCtrl,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Your name',
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Your name',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NameUI(),
                          ),
                        ).then((value) {
                          check_and_show_data();
                        });
                      },
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 35.0,
                  left: 35.0,
                ),
                child: TextField(
                  controller: yourphoneCtrl,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Your phone',
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Your phone',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhoneUI(),
                          ),
                        ).then((value) {
                          check_and_show_data();
                        });
                      },
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 35.0,
                  left: 35.0,
                ),
                child: TextField(
                  controller: youremailCtrl,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Your email',
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Your email',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmailUI(),
                          ),
                        ).then((value) {
                          check_and_show_data();
                        });
                      },
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 35.0,
                  left: 35.0,
                ),
                child: TextField(
                  controller: youraboutCtrl,
                  readOnly: true,
                  decoration: InputDecoration(
                    label: Text(
                      'Your about',
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Your about',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AboutUI(),
                          ),
                        ).then((value) {
                          check_and_show_data();
                        });
                      },
                      icon: Icon(
                        Icons.edit,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

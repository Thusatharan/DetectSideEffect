import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'detect_sideeffects.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? selectedImage;
  bool? isImageUploaded = false;
  TextEditingController _commandController = TextEditingController();
  Future pickImage(ImageSource source) async {
    try {
      print('hello');
      final selectedImage = await ImagePicker().pickImage(source: source);
      if (selectedImage == null) return;

      final imageTemporary = File(selectedImage.path);
      setState(() {
        this.selectedImage = imageTemporary;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/purplebg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Upload Image'),
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 300,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: selectedImage != null
                    ? Image.file(
                        selectedImage!,
                        fit: BoxFit.cover,
                      )
                    : Image.asset("assets/images/noimageavailable.jpg"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => pickImage(ImageSource.gallery),
                    child: Text('Choose image from gallery'),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.purple),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 14))),
                  )
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 4 / 5,
                child: TextField(
                  controller: _commandController,
                  autofocus: false,
                  // controller: _humidityController,
                  decoration: const InputDecoration(
                    hintText: 'Command Input',
                    hintStyle: TextStyle(color: Colors.purple),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.medical_services,
                      color: Colors.purple,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_commandController.text);
                  print(selectedImage);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetectSideEffect(),
                    ),
                  );
                },
                child: Text('Submit'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 14))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DetectSideEffect extends StatefulWidget {
  const DetectSideEffect({Key? key}) : super(key: key);

  @override
  State<DetectSideEffect> createState() => _DetectSideEffectState();
}

class _DetectSideEffectState extends State<DetectSideEffect> {
  void _showPopup() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              // title: Text('Your Current Location'),
              content: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.local_hospital,
                      color: Colors.green,
                      size: 90,
                    ),
                    const Text(
                      'Doctors Details',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                )
              ],
            ));
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
          title: const Text('Detect Side Effect'),
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              width: double.infinity,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(15),
              child: Text('Detected Side effects goes here'),
            ),
            ElevatedButton(
              onPressed: () => _showPopup(),
              child: Text('Choice Doctors'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 14))),
            )
          ],
        ),
      ),
    );
  }
}

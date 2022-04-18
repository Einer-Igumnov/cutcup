import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewTagPage(title: 'Flutter Demo Home Page'),
    );
  }
}

//Design Variables
Color maincolor = Color.fromARGB(255, 255, 211, 0);

//Main Variables
var nowtag = "";

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.9),
            child: Image.asset(
              "images/logo.jpeg",
              height: 70,
              fit: BoxFit.fitHeight,
            ),
          ),
          Align(
            alignment: Alignment(1, 0.9),
            child: Image.asset(
              "images/cuppy2.png",
              height: 400,
              fit: BoxFit.fitHeight,
            ),
          ),
          Align(
            alignment: Alignment(1, -0.6),
            child: SizedBox(
                height: 110,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  SizedBox(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      bottomLeft: Radius.circular(25))),
                              height: 60,
                              width: MediaQuery.of(context).size.width * 5 / 7,
                              child: Center(
                                child: ListTile(
                                  leading: Icon(
                                    Icons.alternate_email_rounded,
                                  ),
                                  title: TextField(
                                    onChanged: (text) {
                                      nowtag = text;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Enter your tag",
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              height: 60,
                              width: 50,
                              child: Center(
                                child: Container(
                                  height: 60,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(25),
                                          bottomLeft: Radius.circular(25))),
                                  child: Center(
                                    child: IconButton(
                                      iconSize: 25,
                                      icon: Icon(
                                        Icons.login,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "No tag?",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  )
                ])),
          ),
        ],
      ),
    );
  }
}

var symbols = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM";
var generated_tag = "";

class NewTagPage extends StatefulWidget {
  const NewTagPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<NewTagPage> createState() => _NewTagPageState();
}

class _NewTagPageState extends State<NewTagPage> {
  void initState() {
    var rng = Random();
    for (int i = 0; i < 10; i++) {
      generated_tag += symbols[rng.nextInt(61)];
    }
    print(generated_tag);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: maincolor,
        body: Stack(
          children: [
            Align(
              alignment: Alignment(0, -0.9),
              child: Image.asset(
                "images/logo.jpeg",
                height: 70,
                fit: BoxFit.fitHeight,
              ),
            ),
            Align(
                alignment: Alignment(0, -0.55),
                child: Text(
                  "Your new tag:",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                )),
            Align(
                alignment: Alignment(0, -0.4),
                child: Text(
                  generated_tag,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ))
          ],
        ));
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            ElevatedButton(
              onPressed: () async {
                final credential = FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: "fc@gmail.com", password: "123456");
                print(credential);
              },
              child: Text("로그인"),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();
                if (result != null) {
                  File file = File(result.files.single.path ?? "");
                  print(file.path);
                  try {
                    await FirebaseStorage.instance
                        .ref(
                            "image/${DateTime.now().millisecondsSinceEpoch}.jpg")
                        .putFile(file);
                  } on FirebaseException catch (e) {
                    print(e.toString());
                  }
                }
              },
              child: Text("팡리업로드"),
            ),
            Divider(),
            ElevatedButton(
              onPressed: () async {
                // await FirebaseFirestore.instance.collection("counter").add(
                //   {
                //     "value": 10,
                //     "timestamp": Timestamp.now(),
                //   },
                // );

                // await FirebaseFirestore.instance
                //     .collection("test")
                //     .doc("flutter")
                //     .set({
                //   "value": 10,
                // });

                // await FirebaseFirestore.instance
                //     .collection("counter")
                //     .doc("3xhF0MT9G5cHsm1LL6yF")
                //     .update(
                //   {
                //     "value": 11,
                //     "timestamp": Timestamp.now(),
                //   },
                // );

                // await FirebaseFirestore.instance
                //     .collection("counter")
                //     .doc("3xhF0MT9G5cHsm1LL6yF")
                //     .delete();
              },
              child: Text("데이터 쓰기"),
            ),
            ElevatedButton(onPressed: () async {
              final snapshot = await FirebaseFirestore.instance
                  .collection("test")
                  .get();
              for (var element in snapshot.docs) {
                print(element.data());
              }
            }, child: Text("데이터 읽기"),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final credential = await FirebaseAuth.instance
                .createUserWithEmailAndPassword(
                    email: "fc@gmail.com", password: "123456");
            print(credential);
          } on FirebaseAuthException catch (e) {
            if (e.code == "weak-password") {
              print("비밀번호를 강화해주세요.");
            } else if (e.code == "email-already-in-use") {
              print("이미 등록된 이메일입니다.");
            }
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

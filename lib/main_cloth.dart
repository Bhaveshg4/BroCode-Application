import 'package:bro_code_02/Routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class main_cloth extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController leaveController = TextEditingController();
  main_cloth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "BroCode",
              style: TextStyle(color: Color.fromARGB(255, 245, 65, 65)),
            )),
        drawer: const Drawer(
          child: UserAccountsDrawerHeader(
            currentAccountPicture: Icon(
              Icons.android,
              size: 120,
            ),
            accountName: Text(
              "Bhavesh Gupta",
              style: TextStyle(fontSize: 25),
            ),
            accountEmail:
                Text("iamanishgupta@gmail.com", style: TextStyle(fontSize: 20)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Image.asset(
                "Worth/Brocode.png",
                fit: BoxFit.cover,
                height: 180,
                width: 380,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Welcome User",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 77, 46))),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: "Name", labelText: "Enter your name"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: roomController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: "Room No.", labelText: "Enter your Room No."),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.presentRoute);
                    uplodedata();
                  },
                  child: const Text("Present Sir")),
              const SizedBox(
                height: 30,
              ),
              const Text(
                  "___________________________or_________________________"),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: leaveController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: "Leave Application",
                      labelText: "Enter reason for leave (100 words )"),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.leaveRoute);
                    uplodedata();
                  },
                  child: const Text("Submit leave application")),
            ],
          ),
        ),
      ),
    );
  }

  void uplodedata() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final CollectionReference _mainCollection = _firestore.collection('person');

    DocumentReference documentReferencer = _mainCollection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "name": nameController.text,
      "room": roomController.text,
      "leave reason": leaveController.text
    };

    await documentReferencer
        .set(data)
        .whenComplete(() => print("Notes item added to the database"))
        .catchError((e) => print(e));
  }
}

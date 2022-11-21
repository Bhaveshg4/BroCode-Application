import 'package:bro_code_02/Routes.dart';
import 'package:flutter/material.dart';

class present extends StatelessWidget {
  const present({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              " BroCode Attendance Page",
              style: TextStyle(color: Color.fromARGB(255, 245, 65, 65)),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Your Attendence is registered....",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 120,
                ),
                Image.asset("Worth/pic11.png", fit: BoxFit.cover),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.loginRoute);
                    },
                    child: Text("Back to login page"))
              ],
            ),
          )),
    );
  }
}

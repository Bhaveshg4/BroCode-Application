import 'package:bro_code_02/Routes.dart';
import 'package:flutter/material.dart';

class Leavepage extends StatelessWidget {
  const Leavepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "BroCode Leave Application Page",
            style: TextStyle(color: Color.fromARGB(255, 245, 65, 65)),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(height: 50),
            const Text(
              "Your leave application is registered....",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Image.asset("Worth/pic10.png", fit: BoxFit.cover),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.loginRoute);
                },
                child: const Text("Back to login page"))
          ]),
        ),
      ),
    );
  }
}

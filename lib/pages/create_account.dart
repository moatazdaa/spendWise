// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:spendwise/sqldb.dart';

class createAccount extends StatefulWidget {
  @override
  State<createAccount> createState() => _createAccountState();
}

class Loginn {
  String username;
  num password;
  Loginn({required this.username, required this.password});
}

class _createAccountState extends State<createAccount> {
// const createAccount({super.key});
  SqlDb sqlDb = SqlDb();

  TextEditingController controlUsername = TextEditingController();

  TextEditingController controlPassword = TextEditingController();
  addNewAccount() async {
    String username = controlUsername.text;
    int password = int.parse(controlPassword.text);

    int response = await sqlDb.insertData('''
      INSERT INTO loginTb (username, password)
      VALUES ("$username", "$password")
    ''');

    controlUsername.clear();
    controlPassword.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 95,
            ),
            Text(
              "Create new account ",
              style: TextStyle(
                fontFamily: "myfont",
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            //text username............
            TextField(
              keyboardType: TextInputType.text,
              controller: controlUsername,
              textInputAction: TextInputAction.next,
              obscureText: false,
              decoration: InputDecoration(
                hintText: "Enter your username",
                // enabledBorder: OutlineInputBorder(borderSide: Divider.createBorderSide(context),),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 72, 117, 153))),
                fillColor: Color(0xFFe4f0f3),
                filled: true,
                contentPadding: const EdgeInsets.all(5),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //text password...........
            TextField(
              maxLength: 8,
              keyboardType: TextInputType.number,
              controller: controlPassword,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter your password",
                // enabledBorder: OutlineInputBorder(borderSide: Divider.createBorderSide(context),),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 72, 117, 153))),
                fillColor: Color(0xFFe4f0f3),
                filled: true,
                contentPadding: const EdgeInsets.all(5),
              ),
            ),

            SizedBox(
              height: 100,
            ),
            // button signup..............
            ElevatedButton(
              onPressed: () {
                addNewAccount();
                Navigator.pop(context);
                //Navigator.pushNamed(context, "/login");
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                ),
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 120, 178, 197)),
                shadowColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 59, 22, 22)),
                elevation: MaterialStateProperty.all(15),
              ),
              child: Text(
                "Signup",
                style: TextStyle(
                  fontFamily: "myfont",
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:spendwise/sqldb.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  //SqlDb sqlDb =SqlDb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Padding(
              padding: const EdgeInsets.only(top: 170),
              child: Image.asset(
                "assets/images/login3.jpg",
                width: double.infinity,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(
              height: 7,
            ),
            //sinup............
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                children: [
                  TextField(
                    //  maxLength: 8,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    decoration: InputDecoration(
                      // icon: Icon(
                      //   Icons.person,
                      //   size: 38,
                      //   color: const Color.fromARGB(255, 0, 0, 0),
                      // ),
                      hintText: "Enter your email",
                      // enabledBorder: OutlineInputBorder(borderSide: Divider.createBorderSide(context),),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 72, 117, 153))),
                      fillColor: Color(0xFFe4f0f3),
                      filled: true,
                      contentPadding: const EdgeInsets.all(5),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    //  maxLength: 8,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      // icon: Icon(
                      //   Icons.key,
                      //   size: 38,
                      //   color: const Color.fromARGB(255, 0, 0, 0),
                      // ),
                      hintText: "Enter your password",
                      // enabledBorder: OutlineInputBorder(borderSide: Divider.createBorderSide(context),),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 72, 117, 153))),
                      fillColor: Color(0xFFe4f0f3),
                      filled: true,
                      contentPadding: const EdgeInsets.all(5),
                    ),
                  ),
                  SizedBox(
                    height: 75,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/mainpage");
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
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "don't have account?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Create Acount ",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),

//login............
          ])),
    );
  }
}


/*

*/ 
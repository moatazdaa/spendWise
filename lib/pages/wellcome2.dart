// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Wellcome2 extends StatelessWidget {
  const Wellcome2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Image.asset(
              "assets/images/spendwise.jpg",
              width: double.infinity,
              height: 350,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Enjoy Our Services",
            style: TextStyle(
              fontFamily: "myfont",
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "Enjoy easily tracking and improving your savings and managing your expenses",
            style: TextStyle(
              fontFamily: "myfont",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 105, 105, 105),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 90,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/login");
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(36),
                ),
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 50, vertical: 16),
              ),
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 120, 178, 197)),
              shadowColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 59, 22, 22)),
              elevation: MaterialStateProperty.all(15),
            ),
            child: Text(
              "Get Strated",
              style: TextStyle(
                fontFamily: "myfont",
                color: Colors.black,
                fontSize: 22,
              ),
            ),
          ),
        ],
      )),
    );
  }
}

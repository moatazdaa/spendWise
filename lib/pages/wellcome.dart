// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Wellcome extends StatelessWidget {
  const Wellcome({super.key});

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
              "assets/images/start.png",
              width: double.infinity,
              height: 400,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Wellcome To Spend Wise App",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "This application will help you achieve your financial goals and assist in organizing your financial life",
            style: TextStyle(
              fontFamily: "assets/fonts/font2.ttf",
              fontSize: 18,
              //color: Color.fromARGB(255, 44, 44, 44),
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 35,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/wellcome2");
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
              padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(horizontal: 80, vertical: 16),
              ),
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 120, 178, 197)),
              shadowColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 59, 22, 22)),
              elevation: MaterialStateProperty.all(15),
            ),
            child: Text(
              "Next",
              style: TextStyle(
                color: const Color.fromARGB(255, 12, 12, 12),
                fontSize: 22,
              ),
            ),
          ),
        ],
      )),
    );
  }
}

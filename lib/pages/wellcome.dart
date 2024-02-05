// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Wellcome extends StatelessWidget {
  const Wellcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(    
        backgroundColor: Color.fromARGB(255, 255, 255, 255),

      body: SafeArea(child: Column(
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
       

        Text("Wellcome To Spend Wise App",
        style: TextStyle(
        fontSize: 27,
        fontWeight: FontWeight.bold,
        ),
        ),
        Text("This application will help you achieve your financial goals and assist in organizing your financial life",
        style: TextStyle(
        fontSize: 18,
        color: const Color.fromARGB(255, 105, 105, 105),
       // fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.center,
        ),
      SizedBox(
      height: 35,
      ),
       Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
         Color.fromARGB(255, 120, 224, 255),
        Color.fromARGB(255, 206, 237, 240),

        //Color(0xFFf9ae54),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    borderRadius: BorderRadius.circular(40),
  ),
  child: ElevatedButton(
    onPressed: () {
      Navigator.pushNamed(context, "/wellcome2");
    },
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 130, vertical: 16),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
    child: Text(
      "next",
      style: TextStyle(
        fontSize: 30,
      ),
    ),
  ),
)
       ], 
      )

      ),
    );
  }
}
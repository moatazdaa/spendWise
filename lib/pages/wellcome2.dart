// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Wellcome2 extends StatelessWidget {
  const Wellcome2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: Color.fromARGB(255, 255, 255, 255),

      body: SafeArea(child: Column(
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
       
         Text("Enjoy Our Services" ,
        style: TextStyle(
          
        fontSize: 27,
        fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        ),
        Text("Enjoy easily tracking and improving your savings and managing your expenses" ,
        style: TextStyle(
          
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 105, 105, 105),
        ),
        textAlign: TextAlign.center,
        ),
        
      SizedBox(
      height: 90,
      ),
       Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 120, 224, 255),
        Color.fromARGB(255, 206, 237, 240),
         
        
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    borderRadius: BorderRadius.circular(40),
  ),
  child: ElevatedButton(
    onPressed: () {
      Navigator.pushNamed(context, "/login");
    },
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 85, vertical: 17),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
    child: Text(
      "Get Strated",
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
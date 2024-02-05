// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 255, 255, 255),

      body: SafeArea(child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
      children: [ 
       
       Padding(
         padding: const EdgeInsets.only(top: 50),
          
               
                
                child:Image.asset(
                  "assets/images/login3.jpg",
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.contain,
                
                ),
              ),

 SizedBox(
          height: 70,
        ),
        //sinup............
        Container(
          decoration: BoxDecoration(
         color: Color(0xFFe4f0f3),
            borderRadius: BorderRadius.circular(66),
          ),
          width: 266,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
          //  maxLength: 8,
            decoration: InputDecoration(
              icon: Icon(Icons.person,
             color: const Color.fromARGB(255, 0, 0, 0),
             ),
              hintText: "Enter your email",
              border: InputBorder.none

            ),
          ),

        ),
        SizedBox(
          height: 15,

        ),
        Container(
          decoration: BoxDecoration(

         color: Color(0xFFe4f0f3),
            borderRadius: BorderRadius.circular(66),
          ),
          width: 266,
          
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
          //  maxLength: 8,
            decoration: InputDecoration(
              icon: Icon(Icons.key,

       color: const Color.fromARGB(255, 0, 0, 0),),
              hintText: "Enter your password",
              border: InputBorder.none

            ),
          ),

        ),

        SizedBox(
          height: 4,
        ),
        
        Text("New To Spend Wise? Create Acount ",
        style: TextStyle(
        fontSize: 16,
        color: const Color.fromARGB(255, 105, 105, 105),

        ),
        ),
//login............
      SizedBox(
      height: 65,
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
      Navigator.pushNamed(context, "/mainpage");
    },
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 125, vertical: 16),
      ),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
    child: Text(
      "Login",
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


/*

*/ 
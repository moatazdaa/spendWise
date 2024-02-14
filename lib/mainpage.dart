// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types

//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:spendwise/mainpage1.dart';
import 'package:spendwise/sqldb.dart';

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  SqlDb sqlDb = SqlDb();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //app bar in main page......................
        bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(242, 255, 255, 255),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                iconSize: 40,
                color: Color.fromARGB(255, 72, 117, 153),
                onPressed: () {
                  //  Navigator.pushNamed(context, "/mainpage");
                },
              ),
              IconButton(
                icon: Icon(Icons.data_thresholding),
                iconSize: 40,
                color: Color.fromARGB(255, 72, 117, 153),
                onPressed: () async {
                  await sqlDb.mydeleteDatabase();
                },
              ),
//000000000000000000000000000000000000000
//000000000000000000000000000000000000000

              IconButton(
                icon: Icon(Icons.notifications_active),
                iconSize: 40,
                color: Color.fromARGB(255, 72, 117, 153),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.logout_rounded),
                iconSize: 40,
                color: Color.fromARGB(255, 72, 117, 153),
                 onPressed: () {
                    Navigator.pushNamed(context, "/login");
                },
              ),
            ],
          ),
        ),

        backgroundColor: Color.fromARGB(246, 245, 243, 238),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              //welcome message .................
              Text(
                "   Hi Moataz",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  fontFamily: "myfont",
                ),
              ),
              SizedBox(height: 10,),

              Text(
                "   Let`s Do Some Transactions... ",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: "myfont",
                ),
              ),
              SizedBox(
                height: 25,
              ),

              //  the visa card .............................
              Container(
                margin: EdgeInsets.only(left: 22),
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 89, 167, 240),
                      Color(0xFF000080)
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/3.png',
                            width: 60,
                            height: 60,
                          ),
                          Text(
                            '**** **** **** 3754',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        'CARD HOLDER',
                        style: TextStyle(
                          fontFamily: "myfont",
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        'Moataz Daafous',
                        style: TextStyle(
                          fontFamily: "myfont",
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Row(
                        children: [
                          Text(
                            'EXPIRES',
                            style: TextStyle(
                              fontFamily: "myfont",
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '10/25',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // end visa card..............
              SizedBox(
                height: 40,
              ),
              //    space line ........
              Container(
                width: double.infinity,
                height: 1,
                color: Color.fromARGB(255, 139, 171, 218),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "    Transactions",
                style: TextStyle(
                  fontFamily: "myfont",
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // textbutton Fainancial  , Expenses.....................
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/AddCreditScreen")
                          .then((value) => {
                                setState(
                                  () {},
                                )
                              });
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(160, 60)),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 255, 255, 255)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Color.fromARGB(255, 139, 171, 218),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    icon: Icon(
                      Icons.monetization_on,
                      color: Color.fromARGB(255, 12, 30, 134),
                      size: 31,
                    ),
                    label: Text(
                      'Credit ',
                      style: TextStyle(
                        fontFamily: "myfont",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/AddDebtScreen")
                          .then((value) => {
                                setState(
                                  () {},
                                )
                              });
                    },
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(160, 60)),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 255, 255, 255)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: Color.fromARGB(255, 139, 171, 218),
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    icon: Icon(
                      Icons.attach_money,
                      color: Color.fromARGB(255, 12, 30, 134),
                      size: 31,
                    ),
                    label: Text(
                      'Debts',
                      style: TextStyle(
                        fontFamily: "myfont",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
              //end scroll button................
              SizedBox(
                height: 20,
              ),

              // Text(
              //   "    Transactions",
              //   style: TextStyle(
              //     fontFamily: "myfont",
              //     fontSize: 26,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black,
              //   ),
              // ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...allTrans.map((item) => transMain(vartitle: item.title))
                      //  transMain(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

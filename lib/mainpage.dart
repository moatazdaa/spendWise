// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:spendwise/mainpage1.dart';
import 'package:spendwise/sqldb.dart';

class mainpage extends StatefulWidget {
  const mainpage({super.key});

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {

  SqlDb sqlDb =SqlDb();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //app bar in main page......................
        bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(223, 255, 255, 255),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                iconSize: 35,
                                color: Color.fromARGB(255, 0, 0, 0),

                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.wallet),
                iconSize: 35,
                color: Color.fromARGB(255, 0, 0, 0),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.search),
                iconSize: 35,
                                color: Color.fromARGB(255, 0, 0, 0),

                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings),
                iconSize: 35,
                                color: Color.fromARGB(255, 0, 0, 0),

                onPressed: () async{
                  await sqlDb.mydeleteDatabase();
                  
                },
              ),
            ],
          ),
        ),

        backgroundColor: Color.fromARGB(246, 223, 220, 211),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //welcome message .................
                Text(
                  "   Hi Moataz..",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),

                Text(
                  "   Let`s Do Some Transactions ",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
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
                  height: 15,
                ),
                // space line ........
                Container(
                  width: double.infinity,
                  height: 2,
                  color: const Color.fromARGB(255, 87, 78, 78),
                ),
                SizedBox(
                  height: 15,
                ),
                // textbutton Fainancial  , Expenses.....................
                Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, 
                  children: [

                    //button fainancial....
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, "/trans_credit")
                        .then((value) => {

                          setState(() {
                            
                          },)
                        });
                      },
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(160, 60)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 255, 255, 255)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              width: 2,
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
                        'Fainancial ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),

                    //button Expenses....
                    TextButton.icon(
                      onPressed: () {},
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(Size(160, 60)),
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 255, 255, 255)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                      icon: Icon(
                        Icons.trending_down,
                        size: 35,
                      ),
                      label: Text(
                        'Expenses',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ]),
                ]),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Row(                
                        mainAxisAlignment: MainAxisAlignment.center ,

                      children: [
                            //button the debts......

                        TextButton.icon(
                          onPressed: () {
 Navigator.pushNamed(context, "/trans_debt")
                        .then((value) => {

                          setState(() {
                            
                          },)
                        });

                          },
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(160, 60)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 255, 255, 255)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: const Color.fromARGB(255, 255, 255, 255),
                                  width: 2,
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
                            'The Debts',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),

                    //button Wallet....
                        TextButton.icon(
                          onPressed: () {},
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(Size(160, 60)),
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 255, 255, 255)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: Color.fromARGB(255, 247, 247, 247),
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          icon: Icon(
                            Icons.trending_down,
                            size: 35,
                          ),
                          label: Text(
                            'Wallet',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                //end scroll button................
                SizedBox(
                  height: 20,
                ),
                Text(
                  "  Transactions",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Column(
                  children: [
                    ...allTrans.map((item) => transMain(vartitle: item.title))
                    //  transMain(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

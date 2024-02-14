// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spendwise/mainpage.dart';
import 'package:spendwise/pages/create_account.dart';
import 'package:spendwise/pages/login.dart';
import 'package:spendwise/pages/wellcome.dart';
import 'package:spendwise/pages/wellcome2.dart';
import 'package:spendwise/transction/credit.dart';
import 'package:spendwise/transction/debt.dart';

void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
    debugShowCheckedModeBanner: false,
      initialRoute: "/",
     routes:{ 
     "/" :(context) => const Wellcome(),
     "/wellcome2" :(context) => const Wellcome2(),
     "/login" :(context) =>  Login(),
          "/mainpage" :(context) => const mainpage(),
            "/AddCreditScreen" :(context) =>  AddCreditScreen(),
            "/AddDebtScreen":(context) => AddDebtScreen(),
            "/create_account":(context)=>createAccount(),
           


     
     
     },
    );
  }
}
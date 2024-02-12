// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spendwise/credit.dart';
import 'package:spendwise/mainpage.dart';
import 'package:spendwise/pages/login.dart';
import 'package:spendwise/pages/wellcome.dart';
import 'package:spendwise/pages/wellcome2.dart';
import 'package:spendwise/transaction/trans_credit.dart';
import 'package:spendwise/transaction/trans_debt.dart';

void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
     routes:{ 
     "/" :(context) => const Wellcome(),
     "/wellcome2" :(context) => const Wellcome2(),
     "/login" :(context) => const Login(),
          "/mainpage" :(context) => const mainpage(),
            "/AddCreditScreen" :(context) =>  AddCreditScreen(),
            "/trans_debt":(context) => trans_debt(key: UniqueKey()),


 
         
     },
    );
  }
}
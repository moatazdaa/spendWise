// ignore_for_file: annotate_overrides, unused_local_variable

import 'package:flutter/material.dart';
import 'package:spendwise/sqldb.dart';
import 'trans_credit.dart';

class trans_credit1 extends StatefulWidget {
  String vartitle;
  num varamount;
  trans_credit1({required this.vartitle, required this.varamount});

  @override
  State<trans_credit1> createState() => _trans_credit1State();
}

class _trans_credit1State extends State<trans_credit1> {
  SqlDb sqlDb = SqlDb();




  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Container(
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black, width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.vartitle.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.varamount.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class credit {
  String descrption;
  num amount;

  credit({required this.descrption, required this.amount});
}

List<credit> allCredit = [
  credit(descrption: "salary", amount: 1000 ),
  credit(descrption: "Investment", amount: 250),
  credit(descrption: "Selling a car", amount: 40),
  credit(descrption: "Free work", amount: 20),
];

// add item in list ........

 addNewCredit() {
  allCredit.add(
    credit(
      descrption: control_descrption.text,
      amount: int.parse(control_amount.text),
    ),
  );
}

num countCredit() {
  int sum = 0;
  for (var creditItem in allCredit) {
    sum += creditItem.amount.toInt();
  }
  return sum;
}

// addNewCredit() async {
//   String describtion = control_descrption.text;
//   int amount = int.parse(control_amount.text);

//   int response = await SqlDb.insertData ('''
//     INSERT INTO creditTb (describtion, amount)
//     VALUES ("$describtion", "$amount")
//   ''');

//   if (response != null) {
//     credit newCredit = credit(descrption: describtion, amount: amount);
//     allCredit.add(newCredit);
//   }
// }

// control in the data between text.....
TextEditingController control_descrption = TextEditingController();
final control_amount = TextEditingController();

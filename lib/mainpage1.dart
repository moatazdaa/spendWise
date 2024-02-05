
import 'package:flutter/material.dart';
import 'package:spendwise/transaction/trans_credit1.dart';
import 'package:spendwise/transaction/trans_debt1.dart';

class transMain extends StatefulWidget {
  String vartitle;
  transMain({required this.vartitle });

  @override
  State<transMain> createState() => _transMainState();
}

class _transMainState extends State<transMain> {

     calcNumber() {
    trans? selectedTrans = allTrans.firstWhere((trans) => trans.title == widget.vartitle, orElse: () => null);
    if (selectedTrans != null) {
      if (selectedTrans.title == "The Debts") {
        return countDebt(); 
      } else if (selectedTrans.title == "Fainancial") {
        return countCredit(); 
      } else if (selectedTrans.title == "The Wallet") {
        return countCredit()-countDebt(); 
    }
    return 0;
  }}
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
                padding: EdgeInsets.all(11),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color.fromARGB(255, 245, 243, 243), width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.vartitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    
                    Text(
                    "${calcNumber()}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //Icon(Icons.monetization_on),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class trans {
  String title;
  int number;
  trans({required this.title, required this.number});
}

List allTrans = [
  
  trans(title: "Fainancial", number: 0),
  trans(title: "The Debts", number: 0),
  trans(title: "The Wallet", number: 0),
];


// calc() {
//   var vartitle; 
//   if (allTrans[0].title == "Fainancial") {
//     // allTrans[0].number = countCredit();
//     // return allTrans[0].number;
//     return countCredit();
//   } else if (allTrans[1].title == "The Debts") {
//    // allTrans[1].number = countDebt();

//   //  return allTrans[1].number;
//   return countDebt();
//   } else {
//     return 0;
//   }
// }

//..........................

//  calcNumber(trans item) {
//   if (item.title == "The Debts") {
//     return countDebt(); 
//   } else if (item.title == "Fainancial") {
//     return countCredit();
//   } else {
//     return 0; 
//   }
// }
// ignore_for_file: prefer_const_constructors, list_remove_unrelated_type

import 'package:flutter/material.dart';
import 'package:spendwise/sqldb.dart';
import 'package:spendwise/transaction/trans_credit1.dart';
import 'trans_debt.dart';

class trans_debt1 extends StatefulWidget {
  String vartitle;
  num varamount;
  trans_debt1({required this.vartitle, required this.varamount});

  @override
  State<trans_debt1> createState() => _trans_debt1State();
}

class _trans_debt1State extends State<trans_debt1> {
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
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: Color.fromARGB(255, 163, 159, 159), width: 1)),
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
                    Row(
                      children: [
                        Text(
                          widget.varamount.toString() + " "+"\$",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        IconButton(
                            onPressed: () async {
                              setState(() {
                                
                              });
                              String descrption = control_descrption.text;
                              String amount = control_amount.text;

                              int response =
                                  await sqlDb.deleteData('''            
                            DELETE FROM debtTb WHERE descrption='cofe', amount='10')
                               
                              ''');

                              print("response");
                              print(response);
                            },
                            icon: Icon(
                              Icons.delete,
                              size: 28,
                              color: Colors.red,
                            )),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

SqlDb sqlDb = SqlDb();

class debt {
  String descrption;
  num amount;

  debt({required this.descrption, required this.amount});
}

List<debt> allDebt = [
  debt(descrption: "coofee", amount: 30),
  debt(descrption: "breackfast", amount: 25),
  debt(descrption: "buy flat", amount: 40),
  debt(descrption: "buy cat", amount: 20),
  debt(descrption: "buy phone", amount: 80),
];
// add item in list ........
// addNewDebt() {
//   allDebt.add(
//     debt(
//         descrption: control_descrption.text,
//               amount: int.parse(control_amount.text),
//          ),
//   );
// }
addNewDebt() async {
  List<Map<String, dynamic>> creditData =
      await sqlDb.selectData('SELECT descrption, amount FROM debtTb');

  for (var data in creditData) {
    String descrption = data['descrption'].toString();
    int amount = int.tryParse(data['amount'].toString()) ?? 0;
    allDebt.add(
      debt(
        descrption: descrption,
        amount: amount,
      ),
    );
  }
}

deleteDebt() {
  allDebt.remove(allDebt[0]);
}

// sum data ........
num countDebt() {
  int sum = 0;
  for (var creditItem in allDebt) {
    sum += creditItem.amount.toInt();
  }
  return sum;
}

// control in the data between text.....
TextEditingController control_descrption = TextEditingController();
final control_amount = TextEditingController();

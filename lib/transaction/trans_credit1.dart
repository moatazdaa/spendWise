
import 'package:flutter/material.dart';
import 'trans_credit.dart';

class trans_credit1 extends StatelessWidget {
 String vartitle;
 num varamount ;
  trans_credit1({required this.vartitle ,required this.varamount});

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
                      vartitle.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                    varamount.toString(),
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
   num  amount ;
  
  credit({required this.descrption,required this.amount});
}

List <credit>allCredit = [
  credit(descrption: "salary", amount: 1000),
  credit(descrption: "Investment", amount:250 ), 
  credit(descrption: "Selling a car", amount: 40),
  credit(descrption: "Free work", amount:20 ),
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
//delete item in list .......
// deleteCredit(){
// allCredit.remove(credit(
//   descrption:control_descrption.text, 
// amount: control_amount.text),);

// }
num  countCredit(){
  int sum =0;
  for(var  creditItem in allCredit){
    sum += creditItem.amount.toInt();
  }
return sum;
}


// control in the data between text.....
TextEditingController control_descrption = TextEditingController();
final control_amount = TextEditingController();

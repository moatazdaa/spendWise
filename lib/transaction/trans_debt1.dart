
import 'package:flutter/material.dart';
import 'trans_debt.dart';

class trans_debt1 extends StatelessWidget {
 String vartitle;
 num varamount ;
  trans_debt1({required this.vartitle ,required this.varamount});

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

class debt {
   String descrption;
   num  amount ;
  
  debt({required this.descrption,required this.amount});
}

List <debt>allDebt = [
  debt(descrption: "coofee", amount: 30),
  debt(descrption: "breackfast", amount:25 ), 
  debt(descrption: "buy flat", amount: 40),
  debt(descrption: "buy cat", amount:20 ),
    debt(descrption: "buy phone", amount:80 ),

];
// add item in list ........
addNewDebt() {
  allDebt.add(
    debt(
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
num  countDebt(){
  int sum =0;
  for(var  creditItem in allDebt){
    sum += creditItem.amount.toInt();
  }
return sum;
}


// control in the data between text.....
TextEditingController control_descrption = TextEditingController();
final control_amount = TextEditingController();

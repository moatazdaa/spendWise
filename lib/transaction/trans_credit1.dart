// // ignore_for_file: annotate_overrides, unused_local_variable, must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:spendwise/sqldb.dart';

// class trans_credit1 extends StatefulWidget {
//   String vartitle;
//   num varamount;
//   trans_credit1({required this.vartitle, required this.varamount});

//   @override
//   State<trans_credit1> createState() => _trans_credit1State();
// }

// class _trans_credit1State extends State<trans_credit1> {

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           FractionallySizedBox(
//             widthFactor: 0.9,
//             child: Container(
//                 margin: EdgeInsets.only(top: 15),
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 255, 255, 255),
//                     borderRadius: BorderRadius.circular(12),
//                     border: Border.all(
//                         color: Color.fromARGB(255, 163, 159, 159), width: 1)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       widget.vartitle.toString(),
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Text(
//                           widget.varamount.toString()+" "+ "\$",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         IconButton(
//                             onPressed: () {
                              

//                             },
//                             icon: Icon(
//                               Icons.delete,
//                               size: 28,
//                               color: Colors.red,
//                             )),
//                       ],
//                     ),
//                   ],
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }


// // class credit {
// //   String descrption;
// //   num amount;

// //   credit({required this.descrption, required this.amount});
// // }



// //.........................................................
// // List<credit> allCredit = [
// //   credit(descrption: "salary", amount: 1000),
// //   credit(descrption: "Investment", amount: 250),
// //   credit(descrption: "Selling a car", amount: 40),
// //   credit(descrption: "Free work", amount: 20),
// // ];

// // add item in list ........

// //  addNewCredit() {
// //   allCredit.add(
// //     credit(
// //       descrption: control_descrption.text,
// //       amount: int.parse(control_amount.text),
// //     ),
// //   );
// // }

// // addNewCredit() async {
// //   List<Map<String, dynamic>> creditData =
// //       await sqlDb.selectData('SELECT descrption, amount FROM creditTb');

// //   for (var data in creditData) {
// //     String descrption = data['descrption'].toString();
// //     int amount = int.tryParse(data['amount'].toString()) ?? 0;

// //     allCredit.add(
// //       credit(
// //         descrption:descrption,
// //         amount: amount,
// //       ),
// //     );
// //   }
// // }

// // num countCredit() {
// //   int sum = 0;
// //   for (var creditItem in allCredit) {
// //     sum += creditItem.amount.toInt();
// //   }
// //   return sum;
// // }

// // addNewcredit() async {
// //   String descrption = control_descrption.text;
// //   int amount = int.parse(control_amount.text);

// //   int response = await SqlDb.insertData ('''
// //     INSERT INTO creditTb (descrption, amount)
// //     VALUES ("$descrption", "$amount")
// //   ''');

// //   if (response != null) {
// //     credit newCredit = credit(descrption: descrption, amount: amount);
// //     allCredit.add(newCredit);
// //   }
// // }

// // // control in the data between text.....
// // TextEditingController control_descrption = TextEditingController();
// // final control_amount = TextEditingController();



//   // Expanded(
//   //             child: ListView.builder(
//   //               itemCount: allCredit.length,
//   //               itemBuilder: (context, index) {
//   //                 return trans_credit1(
//   //                   vartitle: allCredit[index].description,
//   //                   varamount: allCredit[index].amount,
//   //                 );
//   //               },
//   //             ),
//   //           ),
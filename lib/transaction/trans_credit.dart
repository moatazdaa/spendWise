// // ignore_for_file: prefer_const_constructors, unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:spendwise/sqldb.dart';
// import 'package:spendwise/transaction/trans_credit1.dart';

// class trans_credit extends StatefulWidget {
 

//   const trans_credit({required Key? key}) : super(key: key);

//   @override
//   _trans_creditState createState() => _trans_creditState();
// }
 

// class _trans_creditState extends State<trans_credit> {
//   // String vartitle;
//   // num varamount;   
//   //  trans_credit({required this.vartitle, required this.varamount});

//   SqlDb sqlDb = SqlDb();
//     TextEditingController control_descrption = TextEditingController();
//   TextEditingController control_amount = TextEditingController();
//   List<Credit> allCredit = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchCreditData();
//   }

  
//   fetchCreditData() async {
//     List<Map<String, dynamic>> creditData =
//         await sqlDb.selectData('SELECT descrption, amount FROM creditTb');

//     setState(() {
//       allCredit = creditData.map((data) {
//         String description = data['descrption'].toString();
//         int amount = int.tryParse(data['amount'].toString()) ?? 0;

//         return Credit(descrption: description, amount: amount);
//       }).toList();
//     });
//   }

//   addNewCredit() async {
//     String description = control_descrption.text;
//     int amount = int.parse(control_amount.text);

//     int response = await sqlDb.insertData('''
//       INSERT INTO creditTb (descrption, amount)
//       VALUES ("$description", "$amount")
//     ''');

//     if (response != null) {
//       setState(() {
//         allCredit.add(Credit(descrption: description, amount: amount));
//       });
//       control_descrption.clear();
//       control_amount.clear();
//     }
//   }
//     deleteCredit() async {
//     int response = await sqlDb.deleteData('''
//       DELETE FROM creditTb WHERE description = "${widget.vartitle}"
//     ''');

//     if (response != null) {
//       setState(() {
//         allCredit.removeWhere((credit) => credit.descrption == widget.vartitle);
//       });
//     }
//   }

//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             showModalBottomSheet(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return Container(
//                     padding: EdgeInsets.all(22),
//                     color: Color.fromARGB(223, 229, 241, 239),
//                     height: double.infinity,
//                     child: Column(
//                       children: [
//                         TextField(
//                           textInputAction: TextInputAction.next,
//                           controller: control_descrption,
//                           maxLength: 20,
//                           decoration:
//                               InputDecoration(hintText: "add new descrption "),
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         TextField(
//                           textInputAction: TextInputAction.next,
//                           controller: control_amount,
                          
//                           maxLength: 10,
//                           decoration:
//                               InputDecoration(hintText: "add new Amount "),
//                         ),
                        
//                         SizedBox(
//                           height: 22,
//                         ),
//                         TextButton(
//                             onPressed: ()  {
//                               addNewCredit();
//                             //   setState(() {
//                             //     addNewCredit();
//                             //               control_descrption.clear();
//                             //               control_amount.clear();
                                
//                             //   });
//                             //  String descrption = control_descrption.text;
//                             //   String amount = control_amount.text;
//                             //   int response = await sqlDb.insertData('''            
//                             //  INSERT INTO creditTb (descrption, amount)
//                             //   VALUES ("$descrption", "$amount")        
//                             //   ''');
                         
//                             //   print("response");
//                             //   print(response);

                              
//                               Navigator.pop(context);
//                             },
//                             child: Text(
//                               "Add",
//                               style: TextStyle(fontSize: 22),
//                             ))
//                       ],
//                     ),
//                   );
//                 });
//           },
//           child: Icon(Icons.add),
//           backgroundColor: Color.fromARGB(255, 190, 195, 201),
//         ),
//         appBar: AppBar(
//           backgroundColor: Color.fromARGB(255, 190, 195, 201),
//           title: Text("Credit"),
//           centerTitle: true,

//           leading: IconButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, "/mainpage");
//               },
//               icon: Icon(
//                 Icons.arrow_back,
//                 size: 35,
//               )),
//         ),
//         body: SafeArea(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 30,
//               ),
//               // Text(
//               //   "Total of Credit = ${countCredit()}"+" "+ "\$",
//               //   style: TextStyle(fontSize: 30),
//               // ),
//                SizedBox(
//                 height: 20,
//               ),
            
//   Expanded(
//               child: ListView.builder(
//                 itemCount: allCredit.length,
//                 itemBuilder: (context, index) {
//                   return trans_credit1(
//                     vartitle: allCredit[index].descrption,
//                     varamount: allCredit[index].amount,
//                   );
//                 },
//               ),
//             ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }




// }

// class Credit {
//   String descrption;
//   num amount;

//   Credit({required this.descrption, required this.amount});
// }

// //  Expanded(
// //                 child: SingleChildScrollView(
// //                   child: Column(
// //                     children: [
// //                       SizedBox(
// //                         height: 20,
// //                       ),
// //                       ...allCredit.map(
// //                         (item) => trans_credit1(
// //                             vartitle: item.descrption.toString(),
// //                             varamount: int.parse(item.amount.toString())),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
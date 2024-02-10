// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:spendwise/sqldb.dart';
import 'package:spendwise/transaction/trans_credit1.dart';

class trans_credit extends StatefulWidget {
  const trans_credit({required Key? key}) : super(key: key);

  @override
  State<trans_credit> createState() => _trans_creditState();
}

class _trans_creditState extends State<trans_credit> {
  SqlDb sqlDb = SqlDb();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(22),
                    color: Color.fromARGB(223, 229, 241, 239),
                    height: double.infinity,
                    child: Column(
                      children: [
                        TextField(
                          textInputAction: TextInputAction.next,
                          controller: control_descrption,
                          maxLength: 20,
                          decoration:
                              InputDecoration(hintText: "add new describtion "),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          textInputAction: TextInputAction.next,
                          controller: control_amount,
                          
                          maxLength: 10,
                          decoration:
                              InputDecoration(hintText: "add new Amount "),
                        ),
                        
                        SizedBox(
                          height: 22,
                        ),
                        TextButton(
                            onPressed: () async {
                              setState(() {
                                addNewCredit();
                                control_amount.clear();
                                control_descrption.clear();
                              });
                              String describtion = control_descrption.text;
                              String amount = control_amount.text;

                              int response = await sqlDb.insertData('''            
                             INSERT INTO creditTb (describtion, amount)
                              VALUES ("$describtion", "$amount")        
                              ''');
                         
                            
                              print("response");
                              print(response);
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(fontSize: 22),
                            ))
                      ],
                    ),
                  );
                });
          },
          child: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 190, 195, 201),
        ),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 190, 195, 201),
          title: Text("Credit"),
          centerTitle: true,

          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/mainpage");
              },
              icon: Icon(
                Icons.arrow_back,
                size: 35,
              )),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Total of Credit = ${countCredit()}",
                style: TextStyle(fontSize: 30),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      ...allCredit.map(
                        (item) => trans_credit1(
                            vartitle: item.descrption.toString(),
                            varamount: int.parse(item.amount.toString())),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

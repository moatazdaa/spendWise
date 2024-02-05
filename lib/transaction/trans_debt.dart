// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:spendwise/transaction/trans_debt1.dart';

class trans_debt extends StatefulWidget {
  const trans_debt({required Key? key}) : super(key: key);

  @override
  State<trans_debt> createState() => _trans_debtState();
}

class _trans_debtState extends State<trans_debt> {
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
                            onPressed: () {
                              setState(() {
                                addNewDebt();
                              });
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
          // elevation: 20,
          backgroundColor: Color.fromARGB(255, 190, 195, 201),
          title: Text("Debts"),
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
                      "Total of Debts = ${countDebt()}",
                      style: TextStyle(fontSize: 30),
                    ),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                  
                      SizedBox(
                        height: 20,
                      ),
                      ...allDebt.map(
                        (item) => trans_debt1(
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

import 'package:flutter/material.dart';
import 'package:spendwise/sqldb.dart';
import 'package:spendwise/transction/calc.dart';

class trans_debt1 extends StatefulWidget {
  String vartitle;
  num varamount;
  Function(String) deleteDebt;
  trans_debt1(
      {required this.vartitle,
      required this.varamount,
      required this.deleteDebt});

  @override
  State<trans_debt1> createState() => _trans_debt1State();
}

class _trans_debt1State extends State<trans_debt1> {
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
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Color.fromARGB(255, 163, 159, 159),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.vartitle.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "myfont",
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.varamount.toString() + " " + "\$",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.deleteDebt(widget.vartitle);
                        },
                        icon: Icon(
                          Icons.delete,
                          size: 28,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AddDebtScreen extends StatefulWidget {
  @override
  _AddDebtScreenState createState() => _AddDebtScreenState();
}

class _AddDebtScreenState extends State<AddDebtScreen> {
  SqlDb sqlDb = SqlDb();
  TextEditingController controlDescription = TextEditingController();
  TextEditingController controlAmount = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchDebtData();
    calculateTotalDebt();
  }

  fetchDebtData() async {
    List<Map<String, dynamic>> debtData =
        await sqlDb.selectData('SELECT descrption, amount FROM debtTb');

    setState(() {
      allDebt = debtData.map((data) {
        String description = data['descrption'].toString();
        int amount = int.tryParse(data['amount'].toString()) ?? 0;

        return Debt(description: description, amount: amount);
      }).toList();
    });
  }

  addNewDebt() async {
    String description = controlDescription.text;
    int amount = int.parse(controlAmount.text);

    int response = await sqlDb.insertData('''
      INSERT INTO debtTb (descrption, amount)
      VALUES ("$description", "$amount")
    ''');

    if (response != null) {
      setState(() {
        allDebt.add(Debt(description: description, amount: amount));
      });
      controlDescription.clear();
      controlAmount.clear();
    }
  }

  deleteDebt(String description) async {
    int response = await sqlDb.deleteData('''
      DELETE FROM debtTb WHERE descrption = "$description"
    ''');

    if (response != null) {
      setState(() {
        allDebt.removeWhere((debt) => debt.description == description);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Debt',
          style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "myfont",
          ),),
        ),
        body: Padding(
            padding: EdgeInsets.all(17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: controlDescription,
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: controlAmount,
                  decoration: InputDecoration(
                    hintText: 'Amount',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    addNewDebt();
                  },
                  child: Text(
                     'New Debt',
                    style: TextStyle(
                      fontFamily: "myfont",
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    ),
                ),
                SizedBox(height: 15),
                Text('Total Amount: \$${calculateTotalDebt()}',
                    style: TextStyle(
                        fontSize: 19,
                       // fontFamily: "myfont",
                        fontWeight: FontWeight.bold,
                        color:
                            calculateTotalDebt() >= 2000 ? Colors.red : null)),
                SizedBox(height: 20),

                //  space line ........
                Container(
                  width: double.infinity,
                  height: 1,
                  color: const Color.fromARGB(255, 87, 78, 78),
                ),
                SizedBox(height: 10),
                Text(
                  'Debt List',
                  style: TextStyle(
                      fontSize: 21,
                      fontFamily: "myfont",
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: allDebt.length,
                    itemBuilder: (context, index) {
                      return trans_debt1(
                        vartitle: allDebt[index].description,
                        varamount: allDebt[index].amount,
                        deleteDebt: deleteDebt,
                      );
                    },
                  ),
                ),
              ],
            )));
  }
}

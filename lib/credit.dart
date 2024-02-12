import 'package:flutter/material.dart';
import 'package:spendwise/sqldb.dart';
import 'package:spendwise/transaction/trans_debt1.dart';

class trans_credit1 extends StatefulWidget {
  String vartitle;
  num varamount;
  Function(String) deleteCredit;
  trans_credit1(
      {required this.vartitle,
      required this.varamount,
      required this.deleteCredit});

  @override
  State<trans_credit1> createState() => _trans_credit1State();
}

class _trans_credit1State extends State<trans_credit1> {
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
                          widget.deleteCredit(widget.vartitle);
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

class Credit {
  String description;
  num amount;

  Credit({required this.description, required this.amount});
}

class AddCreditScreen extends StatefulWidget {
  @override
  _AddCreditScreenState createState() => _AddCreditScreenState();
}

class _AddCreditScreenState extends State<AddCreditScreen> {
  SqlDb sqlDb = SqlDb();
  TextEditingController controlDescription = TextEditingController();
  TextEditingController controlAmount = TextEditingController();
  List<Credit> allCredit = [];

  @override
  void initState() {
    super.initState();
    fetchCreditData();
  }

  fetchCreditData() async {
    List<Map<String, dynamic>> creditData =
        await sqlDb.selectData('SELECT descrption, amount FROM creditTb');

    setState(() {
      allCredit = creditData.map((data) {
        String description = data['descrption'].toString();
        int amount = int.tryParse(data['amount'].toString()) ?? 0;

        return Credit(description: description, amount: amount);
      }).toList();
    });
  }

  addNewCredit() async {
    String description = controlDescription.text;
    int amount = int.parse(controlAmount.text);

    int response = await sqlDb.insertData('''
      INSERT INTO creditTb (descrption, amount)
      VALUES ("$description", "$amount")
    ''');

    if (response != null) {
      setState(() {
        allCredit.add(Credit(description: description, amount: amount));
      });
      controlDescription.clear();
      controlAmount.clear();
    }
  }

  deleteCredit(String description) async {
    int response = await sqlDb.deleteData('''
      DELETE FROM creditTb WHERE descrption = "$description"
    ''');

    if (response != null) {
      setState(() {
        allCredit.removeWhere((credit) => credit.description == description);
      });
    }
  }

  num calculateTotalAmount() {
    return allCredit.fold(
        0, (previousValue, credit) => previousValue + credit.amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Credit'),
        ),
        body: Padding(
            padding: EdgeInsets.all(16.0),
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
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed:(){addNewCredit();
                  //  Navigator.pop(context);
                  }, 
                  
                  child: Text('Add'),
             
                ),
                 SizedBox(height: 15),
                Text('Total Amount: \$${calculateTotalAmount()}',
                    style:
                        TextStyle(fontSize: 18, 
                        fontWeight: FontWeight.bold,
                        
                        )
                        ),
                SizedBox(height: 20),
                Text(
                  'Credit List',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: allCredit.length,
                    itemBuilder: (context, index) {
                      return trans_credit1(
                        vartitle: allCredit[index].description,
                        varamount: allCredit[index].amount,
                        deleteCredit: deleteCredit,
                      );
                    },
                  ),
                ),
               
              ],
            )));
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:spendwise/sqldb.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //const Login({super.key});
  String errorMessage = "";
  SqlDb sqlDb = SqlDb();
  TextEditingController controlUsername = TextEditingController();
  TextEditingController controlPassword = TextEditingController();
  @override
  void initState() {
    super.initState();
    accountData();
  }

  Future<bool> accountData() async {
    String username = controlUsername.text;
    String password = controlPassword.text;

    if (username.isEmpty || password.isEmpty) {
      return false;
    }

    List response = await sqlDb.selectAccount(
        'SELECT username, password FROM loginTb WHERE username="$username" AND password ="$password"');
    return response.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          //image login...........
          Padding(
            padding: const EdgeInsets.only(top: 170),
            child: Image.asset(
              "assets/images/login3.jpg",
              width: double.infinity,
              height: 150,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 7,
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                //error message ................
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(
                  height: 14,
                ),
                //username ................
                TextField(
                  keyboardType: TextInputType.text,
                  controller: controlUsername,
                  textInputAction: TextInputAction.next,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: "  User Name",
                    // enabledBorder: OutlineInputBorder(borderSide: Divider.createBorderSide(context),),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 72, 117, 153))),
                    fillColor: Color(0xFFe4f0f3),
                    filled: true,
                    contentPadding: const EdgeInsets.all(5),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //password.................
                TextField(
                  keyboardType: TextInputType.number,
                  controller: controlPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "  Password",
                    // enabledBorder: OutlineInputBorder(borderSide: Divider.createBorderSide(context),),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 72, 117, 153))),
                    fillColor: Color(0xFFe4f0f3),
                    filled: true,
                    contentPadding: const EdgeInsets.all(5),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                //button login ...........
                ElevatedButton(
                  onPressed: () {
                    accountData().then((response) {
                      if (response) {
                        Navigator.pushNamed(context, "/mainpage");
                      } else {
                        setState(() {
                          errorMessage =
                              'The Account is not correct plase try again ';
                        });
                        print("The account is not correct");
                      }
                    });
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 120, 178, 197)),
                    shadowColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 59, 22, 22)),
                    elevation: MaterialStateProperty.all(15),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: "myfont",
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                ),

                SizedBox(
                  height: 14,
                ),
                //text create and quations...........
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't have account?",
                      style: TextStyle(
                        fontFamily: "myfont",
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/create_account");
                      },
                      child: Text(
                        "Create Acount ",
                        style: TextStyle(
                          fontFamily: "myfont",
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          //login............
        ]),
      )),
    );
  }
}

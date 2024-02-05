import 'package:flutter/material.dart';

class Transaction{

 final String description ;
final num amount ;
final TransactionType type;

Transaction({
  required this.description ,
  required this.amount,
  required this.type,
});

} 


enum TransactionType {
credit,debit 
}
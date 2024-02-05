//المحفظة
import 'package:spendwise/models/credit.dart';

class Wallet {
  List<Transaction> transactions = [];


  num get_balance() {
    return 0;
  }

  void add_transaction(String description, num amount, TransactionType type) {
    transactions
        .add(Transaction(description: description, amount: amount, type: type));
  }

  num get_total_credit() {
    return 0;
  }

  List<Transaction> get_tran_credit() {
    return [];
  }
}

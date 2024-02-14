
class Credit {
  String description;
  num amount;

  Credit({required this.description, required this.amount});
}

List<Credit> allCredit = [];

num calculateTotalCredit() {
  return allCredit.fold(
      0, (previousValue, credit) => previousValue + credit.amount);
}

//end class credit ..................

class Debt {
  String description;
  num amount;

  Debt({required this.description, required this.amount});
}

List<Debt> allDebt = [];

num calculateTotalDebt() {
  return allDebt.fold(0, (previousValue, debt) => previousValue + debt.amount);
}


//end class debt.................
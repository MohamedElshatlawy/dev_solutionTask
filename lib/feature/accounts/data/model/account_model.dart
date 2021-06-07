class Account {
  String id;
  String name;
  String type;
  bool onBudget;
  bool closed;
  String note;
  int balance;
  int clearedBalance;
  int unclearedBalance;
  String transferPayeeId;
  bool directImportLinked;
  bool directImportInError;
  bool deleted;

  Account({this.id,
    this.name,
    this.type,
    this.onBudget,
    this.closed,
    this.note,
    this.balance,
    this.clearedBalance,
    this.unclearedBalance,
    this.transferPayeeId,
    this.directImportLinked,
    this.directImportInError,
    this.deleted});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    onBudget = json['on_budget'];
    closed = json['closed'];
    note = json['note'];
    balance = json['balance'];
    clearedBalance = json['cleared_balance'];
    unclearedBalance = json['uncleared_balance'];
    transferPayeeId = json['transfer_payee_id'];
    directImportLinked = json['direct_import_linked'];
    directImportInError = json['direct_import_in_error'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['on_budget'] = this.onBudget;
    data['closed'] = this.closed;
    data['note'] = this.note;
    data['balance'] = this.balance;
    data['cleared_balance'] = this.clearedBalance;
    data['uncleared_balance'] = this.unclearedBalance;
    data['transfer_payee_id'] = this.transferPayeeId;
    data['direct_import_linked'] = this.directImportLinked;
    data['direct_import_in_error'] = this.directImportInError;
    data['deleted'] = this.deleted;
    return data;
  }
}
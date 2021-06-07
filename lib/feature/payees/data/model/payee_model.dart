class Payee{

  String id;
  String name;
  String transferAccountId;
  bool deleted;

  Payee({this.id, this.name, this.transferAccountId, this.deleted});

  Payee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    transferAccountId = json['transfer_account_id'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['transfer_account_id'] = this.transferAccountId;
    data['deleted'] = this.deleted;
    return data;
  }


}
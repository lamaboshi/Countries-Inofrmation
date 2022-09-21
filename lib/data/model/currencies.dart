class Currencies {
  SYP? sYP;

  Currencies({this.sYP});

  Currencies.fromJson(Map<String, dynamic> json) {
    sYP = json['SYP'] != null ? SYP.fromJson(json['SYP']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sYP != null) {
      data['SYP'] = sYP!.toJson();
    }
    return data;
  }
}

class SYP {
  String? name;
  String? symbol;

  SYP({this.name, this.symbol});

  SYP.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['symbol'] = symbol;
    return data;
  }
}

class Languages {
  String? ara;

  Languages({this.ara});

  Languages.fromJson(Map<String, dynamic> json) {
    ara = json['ara'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ara'] = ara;
    return data;
  }
}

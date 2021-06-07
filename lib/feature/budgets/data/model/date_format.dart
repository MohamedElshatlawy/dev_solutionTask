class DateFormatType {
  String format;

  DateFormatType({this.format});

  DateFormatType.fromJson(Map<String, dynamic> json) {
    format = json['format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['format'] = this.format;
    return data;
  }
}
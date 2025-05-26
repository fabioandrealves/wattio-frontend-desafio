class MonthlyValue {
  final double? min;
  final double? max;

  MonthlyValue({this.min, this.max});

  factory MonthlyValue.fromJson(Map<String, dynamic> json) {
    return MonthlyValue(
      min: json["min"]?.toDouble(),
      max: json["max"]?.toDouble(),
    );
  }
  //
}

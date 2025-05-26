import 'dart:convert';

import 'monthly_value/monthly_value.dart';

List<CooperativeModel> cooperativeListFromJson(String str) =>
    List<CooperativeModel>.from(
      json.decode(str).map((x) => CooperativeModel.fromJson(x)),
    );

class CooperativeModel {
  final String name;
  final MonthlyValue monthlyValue;
  final double discount;
  final String typeCustomer;

  CooperativeModel({
    required this.name,
    required this.monthlyValue,
    required this.discount,
    required this.typeCustomer,
  });

  factory CooperativeModel.fromJson(Map<String, dynamic> json) {
    return CooperativeModel(
      name: json["name"],
      monthlyValue: MonthlyValue.fromJson(json["monthly_value"]),
      discount: json["discount"].toDouble(),
      typeCustomer: json["type_customer"],
    );
  }
}

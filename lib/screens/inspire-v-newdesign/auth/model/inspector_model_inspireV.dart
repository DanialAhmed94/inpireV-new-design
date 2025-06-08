// To parse this JSON data, do
//
//     final inspectorModel = inspectorModelFromJson(jsonString);

import 'dart:convert';
import 'package:public_housing/screens/inspection_list_screen/model/inspection_res_model.dart';

InspectorModelInspireV inspectorModelFromJson(String str) =>
    InspectorModelInspireV.fromJson(json.decode(str));

String inspectorModelToJson(InspectorModelInspireV data) => json.encode(data.toJson());

class InspectorModelInspireV {
  String type;
  Inspector inspector;

  InspectorModelInspireV({required this.type, required this.inspector});

  factory InspectorModelInspireV.fromJson(Map<String, dynamic> json) => InspectorModelInspireV(
    type: json["type"],
    inspector: Inspector.fromJson(json["inspector"]),
  );

  Map<String, dynamic> toJson() =>
      {"type": type, "inspector": inspector.toJson()};
}

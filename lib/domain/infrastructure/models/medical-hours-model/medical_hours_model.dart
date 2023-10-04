// To parse this JSON data, do
//
//     final medicalHoursModel = medicalHoursModelFromJson(jsonString);

import 'dart:convert';

List<MedicalHoursModel> medicalHoursModelFromJson(String str) => List<MedicalHoursModel>.from(json.decode(str).map((x) => MedicalHoursModel.fromJson(x)));

String medicalHoursModelToJson(List<MedicalHoursModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicalHoursModel {
    final int info;
    final DateTime fecha;

    MedicalHoursModel({
        required this.info,
        required this.fecha,
    });

    factory MedicalHoursModel.fromJson(Map<String, dynamic> json) => MedicalHoursModel(
        info: json["info"],
        fecha: DateTime.parse(json["fecha"]),
    );

    Map<String, dynamic> toJson() => {
        "info": info,
        "fecha": fecha.toIso8601String(),
    };
}

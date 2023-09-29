// To parse this JSON data, do
//
//     final especialitiesResponse = especialitiesResponseFromJson(jsonString);

import 'dart:convert';

List<EspecialitiesResponse> especialitiesResponseFromJson(String str) => List<EspecialitiesResponse>.from(json.decode(str).map((x) => EspecialitiesResponse.fromJson(x)));

String especialitiesResponseToJson(List<EspecialitiesResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EspecialitiesResponse {
    final int codigo;
    final String detalle;

    EspecialitiesResponse({
        required this.codigo,
        required this.detalle,
    });

    factory EspecialitiesResponse.fromJson(Map<String, dynamic> json) => EspecialitiesResponse(
        codigo: json["codigo"],
        detalle: json["detalle"],
    );

    Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "detalle": detalle,
    };
}

// To parse this JSON data, do
//
//     final avalaibleMedicalHours = avalaibleMedicalHoursFromJson(jsonString);

import 'dart:convert';

List<AvalaibleMedicalHoursResponse> avalaibleMedicalHoursFromJson(String str) => List<AvalaibleMedicalHoursResponse>.from(json.decode(str).map((x) => AvalaibleMedicalHoursResponse.fromJson(x)));

String avalaibleMedicalHoursToJson(List<AvalaibleMedicalHoursResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AvalaibleMedicalHoursResponse {
    final int idMedico;
    final String nombreMedico;
    final int idHora;
    final int idBloqueHora;
    final String nombrePaciente;
    final String estadoAtencion;
    final String especialidad;
    final int valorAtencion;
    final int zonaHoraria;
    final dynamic horaDesde;
    final dynamic horaHasta;
    final int idMedicoHora;
    final String horaDesdeText;
    final String fechaText;
    final DateTime fechaHora;
    final String titulo;
    final String prefijoProfesional;
    final bool profesionalesAsociados;

    AvalaibleMedicalHoursResponse({
        required this.idMedico,
        required this.nombreMedico,
        required this.idHora,
        required this.idBloqueHora,
        required this.nombrePaciente,
        required this.estadoAtencion,
        required this.especialidad,
        required this.valorAtencion,
        required this.zonaHoraria,
        required this.horaDesde,
        required this.horaHasta,
        required this.idMedicoHora,
        required this.horaDesdeText,
        required this.fechaText,
        required this.fechaHora,
        required this.titulo,
        required this.prefijoProfesional,
        required this.profesionalesAsociados,
    });

    factory AvalaibleMedicalHoursResponse.fromJson(Map<String, dynamic> json) => AvalaibleMedicalHoursResponse(
        idMedico: json["idMedico"],
        nombreMedico: json["nombreMedico"] ?? '',
        idHora: json["idHora"],
        idBloqueHora: json["idBloqueHora"],
        nombrePaciente: json["nombrePaciente"] ?? '',
        estadoAtencion: json["estadoAtencion"] ?? '',
        especialidad: json["especialidad"] ?? '',
        valorAtencion: json["valorAtencion"],
        zonaHoraria: json["zonaHoraria"],
        horaDesde: json["horaDesde"] ?? '',
        horaHasta: json["horaHasta"] ?? '',
        idMedicoHora: json["idMedicoHora"],
        horaDesdeText: json["horaDesdeText"],
        fechaText: json["fechaText"],
        fechaHora: DateTime.parse(json["fechaHora"]),
        titulo: json["titulo"] ?? '',
        prefijoProfesional:json["prefijoProfesional"] ?? '',
        profesionalesAsociados: json["profesionalesAsociados"],
    );

    Map<String, dynamic> toJson() => {
        "idMedico": idMedico,
        "nombreMedico": nombreMedico,
        "idHora": idHora,
        "idBloqueHora": idBloqueHora,
        "nombrePaciente": nombrePaciente,
        "estadoAtencion": estadoAtencion,
        "especialidad": especialidad,
        "valorAtencion": valorAtencion,
        "zonaHoraria": zonaHoraria,
        "horaDesde": horaDesde,
        "horaHasta": horaHasta,
        "idMedicoHora": idMedicoHora,
        "horaDesdeText": horaDesdeText,
        "fechaText": fechaText,
        "fechaHora": fechaHora,
        "titulo": titulo,
        "prefijoProfesional": prefijoProfesional,
        "profesionalesAsociados": profesionalesAsociados,
    };
}



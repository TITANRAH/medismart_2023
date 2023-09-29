// To parse this JSON data, do
//
//     final medicalDirectory = medicalDirectoryFromJson(jsonString);

import 'dart:convert';

List<MedicalDirectoryResponse> medicalDirectoryFromJson(String str) => List<MedicalDirectoryResponse>.from(json.decode(str).map((x) => MedicalDirectoryResponse.fromJson(x)));

String medicalDirectoryToJson(List<MedicalDirectoryResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedicalDirectoryResponse {
    final int idMedico;
    final String nombreMedico;
    final String apellidoPaternoMedico;
    final String apellidoMaternoMedico;
    final String? codigoPrestacion;
    final String almaMater;
    final String especialidad;
    final int codigoEspecialidad;
    final String fechaText;
    final String horadesDeText;
    final String fotoPerfil;
    final int valorAtencion;
    final String prefijoProfesional;
    final String titulo;
    final String infoPersona1;

    MedicalDirectoryResponse({
        required this.idMedico,
        required this.nombreMedico,
        required this.apellidoPaternoMedico,
        required this.apellidoMaternoMedico,
        required this.codigoPrestacion,
        required this.almaMater,
        required this.especialidad,
        required this.codigoEspecialidad,
        required this.fechaText,
        required this.horadesDeText,
        required this.fotoPerfil,
        required this.valorAtencion,
        required this.prefijoProfesional,
        required this.titulo,
        required this.infoPersona1,
    });

    factory MedicalDirectoryResponse.fromJson(Map<String, dynamic> json) => MedicalDirectoryResponse(
        idMedico: json["idMedico"],
        nombreMedico: json["nombreMedico"],
        apellidoPaternoMedico: json["apellidoPaternoMedico"],
        apellidoMaternoMedico: json["apellidoMaternoMedico"],
        codigoPrestacion: json["codigoPrestacion"],
        almaMater: json["almaMater"],
        especialidad: json["especialidad"],
        codigoEspecialidad: json["codigoEspecialidad"],
        fechaText: json["fechaText"],
        horadesDeText: json["horadesDeText"],
        fotoPerfil: json["fotoPerfil"],
        valorAtencion: json["valorAtencion"],
        prefijoProfesional: json["prefijoProfesional"]!,
        titulo: json["titulo"],
        infoPersona1: json["infoPersona1"],
    );

    Map<String, dynamic> toJson() => {
        "idMedico": idMedico,
        "nombreMedico": nombreMedico,
        "apellidoPaternoMedico": apellidoPaternoMedico,
        "apellidoMaternoMedico": apellidoMaternoMedico,
        "codigoPrestacion": codigoPrestacion,
        "almaMater": almaMater,
        "especialidad": especialidad,
        "codigoEspecialidad": codigoEspecialidad,
        "fechaText": fechaText,
        "horadesDeText": horadesDeText,
        "fotoPerfil": fotoPerfil,
        "valorAtencion": valorAtencion,
        "prefijoProfesional": prefijoProfesional,
        "titulo": titulo,
        "infoPersona1": infoPersona1,
    };
}

// enum PrefijoProfesional {
//     DR,
//     EMPTY,
//     MAT,
//     PERSONAL_TRAINER,
//     PROFESIONAL,
//     PS
// }

// final prefijoProfesionalValues = EnumValues({
//     "Dr.": PrefijoProfesional.DR,
//     "": PrefijoProfesional.EMPTY,
//     "Mat.": PrefijoProfesional.MAT,
//     "Personal Trainer": PrefijoProfesional.PERSONAL_TRAINER,
//     "Profesional": PrefijoProfesional.PROFESIONAL,
//     "Ps.": PrefijoProfesional.PS
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }

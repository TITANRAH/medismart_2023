
import 'package:medismart_2023/domain/entities/medical-directory/medical_directory.dart';
import 'package:medismart_2023/domain/infrastructure/models/medical-directory/medical_directory_response.dart';




class MedicalDirectoryMapper {
  static MedicalDirectory medicalDirectoryResponsetoEntity(MedicalDirectoryResponse directory) => MedicalDirectory(
    almaMater: directory.almaMater,
    apellidoMaternoMedico: directory.apellidoMaternoMedico,
    apellidoPaternoMedico: directory.apellidoPaternoMedico,
    codigoEspecialidad: directory.codigoEspecialidad,
    codigoPrestacion: directory.codigoPrestacion,
    especialidad: directory.especialidad,
    fechaText: directory.fechaText,
    fotoPerfil: directory.fotoPerfil,
    horadesDeText: directory.horadesDeText,
    idMedico: directory.idMedico,
    nombreMedico: directory.nombreMedico,
    titulo: directory.titulo,
    valorAtencion: directory.valorAtencion,

 );
}

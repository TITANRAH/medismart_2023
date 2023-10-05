import 'package:medismart_2023/domain/entities/avalaible-medical-hours-entity/avalaible_medical_hours_entity.dart';
import 'package:medismart_2023/domain/infrastructure/models/avalaible-medical-hours/avalaible_medical_hours_model.dart';

class AvalaibleMedicalHoursMapper {
  static AvalaibleMedicalHoursEntity AvalableMedicalDirectoryResponsetoEntity(AvalaibleMedicalHoursResponse avalaiblesHours) => AvalaibleMedicalHoursEntity(
   
especialidad: avalaiblesHours.especialidad.toString(),
estadoAtencion: avalaiblesHours.estadoAtencion.toString(),
fechaHora: avalaiblesHours.fechaHora,
fechaText: avalaiblesHours.fechaText,
horaDesde: avalaiblesHours.horaDesde,
horaDesdeText: avalaiblesHours.horaDesdeText,
horaHasta: avalaiblesHours.horaHasta,
idBloqueHora: avalaiblesHours.idBloqueHora,
idHora: avalaiblesHours.idHora,
idMedico: avalaiblesHours.idMedico,
idMedicoHora: avalaiblesHours.idMedicoHora,
nombreMedico: avalaiblesHours.nombreMedico.toString(),
nombrePaciente: avalaiblesHours.nombreMedico.toString(),
prefijoProfesional: avalaiblesHours.prefijoProfesional.toString(),
profesionalesAsociados: avalaiblesHours.profesionalesAsociados,
titulo: avalaiblesHours.titulo.toString(),
valorAtencion: avalaiblesHours.valorAtencion,
zonaHoraria: avalaiblesHours.zonaHoraria,


 );
}

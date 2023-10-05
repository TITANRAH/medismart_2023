
import 'package:medismart_2023/domain/entities/avalaible-medical-hours-entity/avalaible_medical_hours_entity.dart';

abstract class AvalaibleMedicalHoursRepository{
  Future<List<AvalaibleMedicalHoursEntity>> getAvalaibleMedicalHours(
      String fecha,
      int idMedico,
      bool maniana,
      bool inicial,
      int idConvenio,
      int idPaciente,
      int tipoHorario);
}

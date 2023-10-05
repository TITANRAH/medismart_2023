
import 'package:medismart_2023/domain/entities/medical-hours-entity/medical_hours_entity.dart';

abstract class MedicalHoursDataSourceResponse {
  Future<List<MedicalHours>> getMedicalHours(int idMedico, String fechaSeleccion, int idConvenio, String fechaSeleccionEstatica, int idPaciente);
}


